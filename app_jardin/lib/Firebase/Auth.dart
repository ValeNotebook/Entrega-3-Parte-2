import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/navigator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Authenticator {
  //Iniciar Sesion
  static Future<User?> iniciarSesion(BuildContext context, errorText) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSignIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSignInAccount =
        await objGoogleSignIn.signIn();

    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication.accessToken,
          idToken: objGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);
        user = userCredential.user;
        print(user?.displayName);
        Navigator.pushNamedAndRemoveUntil(context, 'nav', (_) => false);
        return user;
      } on FirebaseAuthException catch (ex) {
        switch (ex.code) {
          case 'user-not-found':
            errorText = 'Usuario no existe';
            break;
          case 'wrong-password':
            errorText = 'Contraseña Incorrecta';
            break;
          default:
            errorText = '';
        }

        print('Codigo: ${ex.code}');
      }
      catchError(error) {
        print(
            "Algo Ha Salido Mal: ${error.message}"); //por si el debuger de vs se encuentra con agarrar todas las excepciones
      }
    }
  }

  //Cerrar Sesion
  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Hubo Un Error");
    }
  }

  //Get user uid.

}
