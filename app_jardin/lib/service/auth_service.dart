import 'package:firebase_auth/firebase_auth.dart';
//import 'package:lib/models/users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // DESLOGEARSE
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
