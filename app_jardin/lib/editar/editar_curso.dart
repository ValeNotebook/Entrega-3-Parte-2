// ignore_for_file: prefer_const_constructors

import 'package:app_jardin/providers/cursos_provider.dart';
import 'package:app_jardin/providers/educadoras_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:prueba_api/providers/tiasprovider.dart';

class EditarCursos extends StatefulWidget {
  String cod;
  EditarCursos(this.cod, {Key? key}) : super(key: key);

  @override
  State<EditarCursos> createState() => _EditarCursosState();
}

class _EditarCursosState extends State<EditarCursos> {
  final formKey = GlobalKey<FormState>();
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController gradoCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBurdeo,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kRosa,
        title: Text(
          'Editar Curso ${widget.cod}',
          style: TextStyle(color: kMorado),
        ),
        leading: IconButton(
          color: kMorado,
          icon: FaIcon(FontAwesomeIcons.arrowLeftLong),
          tooltip: 'Volver',
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {});
          },
        ),
      ),
      body: FutureBuilder(
        future: CursosProvider().getCurso(widget.cod),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data;

          codigoCtrl.text = widget.cod;
          nombreCtrl.text = data['nombre_curso'];
          gradoCtrl.text = data['grado'].toString();
          descripcionCtrl.text = data['descripcion'];

          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: codigoCtrl,
                      decoration: decorationInput('Codigo'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nombreCtrl,
                      decoration: decorationInput('Nombre'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: gradoCtrl,
                      decoration: decorationInput('Grado'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print('on pressed');
                        //print('esta pulsando');
                        CursosProvider().cursosEditar(
                          widget.cod,
                          codigoCtrl.text.trim(),
                          nombreCtrl.text.trim(),
                          gradoCtrl.text.trim(),
                          descripcionCtrl.text.trim(),
                        );
                        print('ESTA ES LA RES');

                        setState(() {});
                        //return;
                        Navigator.pop(context);
                      },
                      child: Text('Agregar'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

InputDecoration decorationInput(String label) {
  return InputDecoration(
    filled: true,
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
