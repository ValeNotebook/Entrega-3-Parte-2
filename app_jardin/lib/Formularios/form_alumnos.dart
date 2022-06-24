import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

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
      backgroundColor: kVioleta,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kRosa,
            title: Text(
              'Formulario Ingreso Niños y Niñas',
              style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
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
                controller: rutCtrl,
                decoration: InputDecoration(
                  labelText: 'Rut',
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                ),
                style: TextStyle(fontSize: 18),
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
                controller: nombreCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                ),
                style: TextStyle(fontSize: 18),
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
                controller: apellidoCtrl,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                ),
                style: TextStyle(fontSize: 18),
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
                controller: generoCtrl,
                decoration: InputDecoration(
                  labelText: 'Genero',
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: kMorado),
                  ),
                ),
                style: TextStyle(fontSize: 18, color: kMorado),
              ),
              Divider(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: kVerde,
                        padding: EdgeInsets.all(16),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: Text('Agregar Niño'),
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
