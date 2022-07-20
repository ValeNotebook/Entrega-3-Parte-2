// ignore: file_names

import 'package:app_jardin/Firebase/noticias/auth_noticias.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

import 'package:app_jardin/paleta_colores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrarseForm extends StatefulWidget {
  const RegistrarseForm({Key? key}) : super(key: key);

  @override
  Registrarse createState() => Registrarse();
}

class Registrarse extends State<RegistrarseForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int bigInt = 0;
    int total = 0;
    int total2 = 0;
    int valor_ant = 0;
    int val_may = 0;

    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/nuevo_usuario.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Noticias',
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            //shadow letra
                            offset: Offset(5.0, 5.0), //distancia de la letra
                            color: Color(0xff676FA3), //sombra violeta
                            blurRadius: 10.0,
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              tituloNav(), //Esta es la navegacion
              Expanded(
                child: StreamBuilder(
                  stream: FireStoreService().noticias(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                    if (!snap.hasData ||
                        snap.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.separated(
                        itemBuilder: ((context, index) {
                          var noticia = snap.data!.docs[index];

                          bigInt = 0;

                          var fecha = DateTime.fromMillisecondsSinceEpoch(
                                  noticia['fecha'].seconds * 1000,
                                  isUtc: true)
                              .format('dd-MMMM-yyyy', 'es' 'ES');

                          //la manera mas simple de hacer un campo id autoincremental
                          total = snap.data!.docs.length;
                          print('valor actual de total');
                          print(total);
                          print('id ');
                          print(noticia['noticia_id']);
                          valor_ant = noticia['noticia_id'];
                          if (valor_ant >= val_may) {
                            val_may = valor_ant;
                          }
                          return Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Card(
                              margin: EdgeInsets.all(10.0),
                              color: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceTint),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.menu_book_sharp,
                                      color: kRosa,
                                    ),
                                    title: Text(
                                      '${noticia['titulo']}',
                                      style: TextStyle(color: kRosa),
                                    ),
                                    subtitle: Text(
                                      DateTime.fromMillisecondsSinceEpoch(
                                              noticia['fecha'].seconds * 1000,
                                              isUtc: true)
                                          .timeago(locale: 'es'),
                                      style: TextStyle(color: kRosa),
                                    ),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              backgroundColor: kCeleste,
                                              title: Text(
                                                '${noticia['titulo']}',
                                                style:
                                                    TextStyle(color: kOscuro),
                                              ),
                                              children: [
                                                Divider(),
                                                ListTile(
                                                  title: Text(
                                                      'Publicado :' +
                                                          ' ' +
                                                          fecha,
                                                      style: TextStyle(
                                                          fontSize: 15)),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                      noticia['descripcion']),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: snap.data!.docs.length);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Navegador entre login y registrarse

class tituloNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            //padding: EdgeInsets.only(bottom: 100),
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, 'login'),
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffEDD2F3),
                ),
              ),
            ),
          ),
          Flexible(
            //padding: EdgeInsets.only(bottom: 100),
            child: Text(
              '/',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xffEDD2F3),
              ),
            ),
          ),
          Flexible(
            //padding: EdgeInsets.only(bottom: 100),
            child: Center(
              child: Text(
                'Noticias',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
