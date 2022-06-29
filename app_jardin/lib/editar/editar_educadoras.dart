// ignore_for_file: prefer_const_constructors

import 'package:app_jardin/providers/educadoras_provider.dart';
import 'package:flutter/material.dart';
//import 'package:prueba_api/providers/tiasprovider.dart';

class EditarTias extends StatefulWidget {
  String tia;
  EditarTias(this.tia, {Key? key}) : super(key: key);

  @override
  State<EditarTias> createState() => _EditarTiasState();
}

class _EditarTiasState extends State<EditarTias> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tia ${widget.tia}'),
      ),
      body: FutureBuilder(
        future: EducadorasProvider().getTia(widget.tia),
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

          rutCtrl.text = data['rut_educadora'];
          nombreCtrl.text = data['nombre_tia'];
          apellidoCtrl.text = data['apellido'];

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
                          labelText: 'NOMBRE', border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: apellidoCtrl,
                      decoration: InputDecoration(
                          labelText: 'APELLIDO', border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print(nombreCtrl.text.trim());
                        //print('esta pulsando');
                        EducadorasProvider().tiasEditar(
                            widget.tia,
                            rutCtrl.text.trim(),
                            nombreCtrl.text.trim(),
                            apellidoCtrl.text.trim());

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
