import 'package:app_jardin/Firebase/Auth.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/navigator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Login createState() => Login();
}

class Login extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.blue, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.colorDodge,
          child: Container(
            height: size.height - 10,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        //Hasta aqui la imagen oscura de fondo
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    'Jardin Infantil \n       Arcoiris',
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
              tituloNav(),
              _btnLogearse(size, context),
              SizedBox(
                //SizedBox para separar el boton del final
                height: 160,
              ),
              mensajeError(),
            ],
          ),
        ),
      ],
    );
  }

// Console Error Text

  Container mensajeError() {
    return Container(
      child: Text(errorText,
          style: TextStyle(
            color: Color(0xff3E8E7E),
          )),
    );
  }

//btn iniciar sesion por ahora redirecciona a HomePage

  Container _btnLogearse(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      child: ElevatedButton.icon(
        onPressed: () async {
          User? user = await Authenticator.iniciarSesion(context, errorText);
          print(user?.displayName);
        },
        icon: FaIcon(FontAwesomeIcons.google, size: 25),
        label: Text(
          'Iniciar Sesión Con Google',
          style: kBodyText,
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Center(
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Text(
              '/',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xffEDD2F3),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, 'registrarse'),
              child: Text(
                'Noticias',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffEDD2F3)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
