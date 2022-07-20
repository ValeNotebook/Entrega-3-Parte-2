// ignore_for_file: depend_on_referenced_packages

import 'package:app_jardin/Firebase/noticias/auth_noticias.dart';
import 'package:flutter/material.dart';
//import 'package:noticias_prueba/services/auth_service.dart';

class NoticiasEditar extends StatefulWidget {
  String noticiasId;

  NoticiasEditar(this.noticiasId, {Key? key}) : super(key: key);

  @override
  State<NoticiasEditar> createState() => _NoticiasEditarState();
}

class _NoticiasEditarState extends State<NoticiasEditar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloCtrl = TextEditingController();
    TextEditingController descripcionCtrl = TextEditingController();
    TextEditingController fechaCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('agregar noticias'),
      ),
      body: Form(
          child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            TextFormField(
              controller: tituloCtrl,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextFormField(
              controller: descripcionCtrl,
              decoration: InputDecoration(
                labelText: 'Descripcion',
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    String titulo = tituloCtrl.text.trim();
                    String descripcion = descripcionCtrl.text.trim();
                    final fecha = DateTime.now();
                    //int noticias_id = widget.bigInt++;
                    print('nuevo dato');

                    FireStoreService()
                        .noticiasEditar(widget.noticiasId, titulo, descripcion);
                    Navigator.pop(context);
                  },
                  child: Text('Agregar')),
            ),
          ],
        ),
      )),
    );
  }
}
