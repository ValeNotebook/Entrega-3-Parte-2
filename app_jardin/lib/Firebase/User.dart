import 'package:app_jardin/Firebase/Auth.dart';
import 'package:app_jardin/Firebase/noticias/noticias_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//TopMenu

class TopMenu extends StatefulWidget {
  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _user = auth.currentUser;
    final url = _user?.photoURL;
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Perfil De ${_user?.displayName}',
            style: TextStyle(color: kMorado, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(),
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(url!),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox.fromSize(
              size: Size(280, 50),
              child: Material(
                color: kMorado,
                child: InkWell(
                  splashColor: kVerde,
                  onTap: () {
                    MaterialPageRoute ruta =
                        MaterialPageRoute(builder: (context) {
                      return NoticiasPage();
                    });

                    Navigator.push(context, ruta).then((value) {
                      setState(() {});
                    });
                  }, //Aqui redirecciona a Noticias
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.newspaper,
                        size: 25,
                        color: Colors.white,
                      ), // <-- Icon
                      Text("   Administrar Noticias ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox.fromSize(
              size: Size(280, 50),
              child: Material(
                color: kMorado,
                child: InkWell(
                  splashColor: kVerde,
                  onTap: () async {
                    final FirebaseAuth _auth = FirebaseAuth.instance;

                    await Authenticator.signOut(context: context);
                    Navigator.pushNamedAndRemoveUntil(context, 'login',
                        (_) => false); //para evitar que vuelvan a lo anterior
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.circleXmark,
                        size: 25,
                        color: Colors.white,
                      ), // <-- Icon
                      Text(
                        "    Cerrar Sesión ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
