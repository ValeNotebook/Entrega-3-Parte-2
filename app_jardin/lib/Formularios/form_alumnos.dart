import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:image_picker/image_picker.dart';

class FormAlumnos extends StatefulWidget {
  FormAlumnos({Key? key}) : super(key: key);

  @override
  State<FormAlumnos> createState() => _FormAlumnosState();
}

class _FormAlumnosState extends State<FormAlumnos> {
  final formKey = GlobalKey<FormState>();

  TextEditingController rutController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController generoController = TextEditingController();

  String label1 = 'Rut';
  String label2 = 'Nombre';
  String label3 = 'Apellido';
  String label4 = 'Genero';

  String rutValue = '';
  String nombreValue = '';
  String apellidoValue = '';
  String generoValue = '';

  String errCodigo = '';
  String errNombre = '';

  @override
  Widget build(BuildContext context) {
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
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                cursorColor: kMorado,
                keyboardType: TextInputType.number,
                controller: rutController,
                decoration: decorationInput(label1),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errCodigo,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                cursorColor: kMorado,
                controller: nombreController,
                decoration: decorationInput(label2),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                cursorColor: kMorado,
                controller: apellidoController,
                decoration: decorationInput(label3),
                style: TextStyle(fontSize: 15),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                cursorColor: kMorado,
                controller: generoController,
                decoration: decorationInput(label4),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kMorado,
                        padding: EdgeInsets.all(16),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: Text(
                      'Agregar Niño',
                      style: TextStyle(color: kRosa),
                    ),
                    onPressed: () async {
                      String rut = rutController.text.toString();
                      String nombre = nombreController.text;
                      String apellido = apellidoController.text;
                      String genero = generoController.text;

                      var res = await NinosProvider()
                          .ninosAgregar(rut, nombre, apellido, genero);
                      if (res.isEmpty) {
                        print(res);
                        //Aqui un Snackbar
                      } else {
                        Navigator.pop(context);
                      }
                      //int stock = int.tryParse(stockCtrl.text) ?? 0;
                      //int precio = int.tryParse(precioCtrl.text) ?? 0;

                      //var respuesta = await NinosProvider().ninosAgregar(
                      //rutValue.trim(),
                      //nombreValue.trim(),
                      //apellidoValue.trim(),
                      //generoValue.trim(),
                      //);
                    }),
              ),
            ],
          ),
        ),
      ),
      //Navigator.pop(context);
    );
  }

//Decoracion para los input

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
}
