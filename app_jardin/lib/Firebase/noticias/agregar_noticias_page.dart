// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_adjacent_string_concatenation, non_constant_identifier_names

import 'package:app_jardin/Firebase/noticias/auth_noticias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:noticias_prueba/services/auth_service.dart';

class NoticiasAgregarPage extends StatefulWidget {
  int bigInt;
  NoticiasAgregarPage(this.bigInt, {Key? key}) : super(key: key);

  @override
  State<NoticiasAgregarPage> createState() => _NoticiasAgregarPageState();
}

class _NoticiasAgregarPageState extends State<NoticiasAgregarPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloCtrl = TextEditingController();
    TextEditingController descripcionCtrl = TextEditingController();
    TextEditingController fechaCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: kBurdeo,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kRosa,
            title: Text(
              'Formulario Ingreso Niños y Niñas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kMorado,
              ),
            ),
            leading: IconButton(
              color: kMorado,
              icon: FaIcon(FontAwesomeIcons.arrowLeftLong),
              tooltip: 'Volver',
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
            )),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Divider(),
            TextFormField(
              cursorColor: kMorado,
              controller: tituloCtrl,
              decoration: decorationInput('Titulo'),
            ),
            Divider(),
            TextFormField(
              cursorColor: kMorado,
              controller: descripcionCtrl,
              decoration: decorationInput('Descripcion'),
            ),
            Divider(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kMorado,
                    padding: EdgeInsets.all(16),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                  'Agregar',
                  style: TextStyle(color: kRosa),
                ),
                onPressed: () {
                  String titulo = tituloCtrl.text.trim();
                  String descripcion = descripcionCtrl.text.trim();
                  final fecha = DateTime.now();
                  //int noticias_id = widget.bigInt++;
                  print('nuevo dato');
                  print(widget.bigInt++);

                  FireStoreService().noticasAgregar(
                      widget.bigInt++, titulo, descripcion, fecha);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

InputDecoration decorationInput(String label) {
  return InputDecoration(
    filled: true, //<-- SEE HERE
    fillColor: kCeleste,
    labelText: label,
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5.0),
      borderSide: BorderSide(color: kMorado),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5.0),
      borderSide: BorderSide(color: kMorado),
    ),
  );
}
