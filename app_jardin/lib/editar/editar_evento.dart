// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, must_be_immutable

import 'package:app_jardin/paleta_colores.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/providers/eventos_provider.dart';

class EditarEventos extends StatefulWidget {
  int evento;

  EditarEventos(this.evento, {Key? key}) : super(key: key);

  @override
  State<EditarEventos> createState() => _EditarEventosState();
}

class _EditarEventosState extends State<EditarEventos> {
  final formKey = GlobalKey<FormState>();

  TextEditingController codCtrl = TextEditingController();
  TextEditingController ninoCtrl = TextEditingController();
  TextEditingController tiaCtrl = TextEditingController();
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
          'Evento N° ${widget.evento}',
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
        future: EventosProvider().getEvento(widget.evento),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            print(Text('evento'));
            print(widget.evento);
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snap.data;

          // print(data['rut_educadora']);
          // print(data['nombre_tia']);
          // print(data['apellido']);

          codCtrl.text = data[0]["cod_evento"].toString();
          ninoCtrl.text = data[0]["nino"];
          tiaCtrl.text = data[0]["tia"];
          descripcionCtrl.text = data[0]["descripcion"];

          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ninoCtrl,
                      decoration: decorationInput('Rut'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: tiaCtrl,
                      decoration: decorationInput('Nombre'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descripcionCtrl,
                      decoration: decorationInput('Apellido'),
                    ),
                  ),
                  Divider(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kMorado,
                        padding: EdgeInsets.all(16),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: Text(
                      'Agregar Cambios',
                      style: TextStyle(color: kRosa),
                    ),
                    onPressed: () async {
                      //print('esta pulsando');
                      EventosProvider().eventoModificar(
                        widget.evento,
                        ninoCtrl.text.trim(),
                        tiaCtrl.text.trim(),
                        descripcionCtrl.text.trim(),
                      );

                      setState(() {});
                      //return;
                      Navigator.pop(context);
                    },
                  )
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
