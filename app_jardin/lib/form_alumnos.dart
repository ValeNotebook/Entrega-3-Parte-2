import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';

class FormAlumnos extends StatefulWidget {
  FormAlumnos({Key? key}) : super(key: key);

  @override
  State<FormAlumnos> createState() => _FormAlumnosState();
}

class _FormAlumnosState extends State<FormAlumnos> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: rutCtrl,
                decoration: InputDecoration(labelText: 'Rut'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errCodigo,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: apellidoCtrl,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                controller: generoCtrl,
                decoration: InputDecoration(labelText: 'Genero'),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    child: Text('Agregar Nino'),
                    onPressed: () async {
                      //int stock = int.tryParse(stockCtrl.text) ?? 0;
                      //int precio = int.tryParse(precioCtrl.text) ?? 0;

                      var respuesta = await NinosProvider().ninosAgregar(
                        rutCtrl.text.trim(),
                        nombreCtrl.text.trim(),
                        apellidoCtrl.text.trim(),
                        generoCtrl.text.trim(),
                      );

                      setState(() {});
                      return;
                    }),
              ),
            ],
          ),
        ),
      ),
      //Navigator.pop(context);
    );
  }
}
