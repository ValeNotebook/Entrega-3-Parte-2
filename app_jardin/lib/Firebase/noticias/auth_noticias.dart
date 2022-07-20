import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance
        .collection('noticias')
        .orderBy('fecha', descending: true)
        .snapshots();
  }

  Future noticasAgregar(
      int noticias_id, String titulo, String descripcion, fecha) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha,
      'noticia_id': noticias_id
    });
  }

  Future noticiasBorrar(String noticias_id) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(noticias_id)
        .delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNoticia(
      String noticiaId) async {
    return await FirebaseFirestore.instance
        .collection('noticias')
        .doc(noticiaId)
        .get();
  }

  Future noticiasEditar(
    String noticiaId,
    String titulo,
    String descripcion,
  ) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(noticiaId)
        .update({
      'titulo': titulo,
      'descripcion': descripcion,
    });
  }
}
