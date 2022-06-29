// ignore_for_file: prefer_const_constructors

import 'package:app_jardin/paleta_colores.dart';
import 'package:app_jardin/providers/ni%C3%B1os_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditarNinos extends StatefulWidget {
  String nino;
  String nombre;

  EditarNinos(this.nino, this.nombre, {Key? key}) : super(key: key);

  @override
  State<EditarNinos> createState() => _EditarNinosState();
}

class _EditarNinosState extends State<EditarNinos> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();
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
          'Editar' + ' ' + widget.nombre,
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
          future: NinosProvider().getNino(widget.nino),
          //TiasProvider().getTia(widget.tia),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var data = snapshot.data;

            // print(data['rut_educadora']);
            // print(data['nombre_tia']);
            // print(data['apellido']);

            rutCtrl.text = data['rut_nino'];
            nombreCtrl.text = data['nombre_nino'];
            apellidoCtrl.text = data['apellido'];
            generoCtrl.text = data['genero'];

            return Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: rutCtrl,
                          decoration: InputDecoration(
                              labelText: 'RUT', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nombreCtrl,
                          decoration: InputDecoration(
                              labelText: 'NOMBRE',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: apellidoCtrl,
                          decoration: InputDecoration(
                              labelText: 'APELLIDO',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            print(nombreCtrl.text.trim());
                            //print('esta pulsando');
                            NinosProvider().NinosEditar(
                                widget.nino,
                                rutCtrl.text.trim(),
                                nombreCtrl.text.trim(),
                                apellidoCtrl.text.trim(),
                                generoCtrl.text.trim());

                            setState(() {});
                            //return;
                            Navigator.pop(context);
                          },
                          child: Text('Agregar'))
                    ],
                  ),
                ));
          }),
    );
  }
}
