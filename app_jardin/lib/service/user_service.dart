import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServiceUsers {
  //Get de usuarios

  Stream<QuerySnapshot> usuarios() {
    return FirebaseFirestore.instance.collection('usuarios').snapshots();
  }

  //Crear de usuario
  //SE CREA EL USUARIO TOMANDO EL UID DEL AUTH Y LO PASA COMO ID PARA FUTURAS BUSQUEDAS

  Future usuarioCrear(String nombre, String email, String id) {
    return FirebaseFirestore.instance.collection('usuarios').doc().set({
      'id': id,
      'email': email,
      'nombre': nombre,
    });
  }
}
