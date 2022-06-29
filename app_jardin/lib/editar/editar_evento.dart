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
                      decoration: InputDecoration(
                          labelText: 'RUT', border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: tiaCtrl,
                      decoration: InputDecoration(
                          labelText: 'NOMBRE', border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descripcionCtrl,
                      decoration: InputDecoration(
                          labelText: 'APELLIDO', border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        //print(nombreCtrl.text.trim());
                        //print('esta pulsando');
                        //EventosProvider().EventosEditar(
                        //widget.nino,
                        //rutCtrl.text.trim(),
                        //nombreCtrl.text.trim(),
                        //apellidoCtrl.text.trim(),
                        //generoCtrl.text.trim());

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
