import 'package:app_jardin/providers/cursos_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class FormNiveles extends StatefulWidget {
  FormNiveles({Key? key}) : super(key: key);

  @override
  State<FormNiveles> createState() => _FormNivelesState();
}

class _FormNivelesState extends State<FormNiveles> {
  final formKey = GlobalKey<FormState>();

  TextEditingController codigoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController gradoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  String label1 = 'Codigo Del Curso';
  String label2 = 'Nombre Del Curso';
  String label3 = 'Grado Del Curso';
  String label5 = 'Descripcion';

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
              'Formulario Ingreso Datos Cursos',
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
              //Codigo Del Curso
              TextFormField(
                cursorColor: kMorado,
                controller: codigoController,
                decoration: decorationInput(label1),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              //Nombre Del Curso
              TextFormField(
                cursorColor: kMorado,
                controller: nombreController,
                decoration: decorationInput(label2),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              //grado del curso
              TextFormField(
                cursorColor: kMorado,
                controller: gradoController,
                decoration: decorationInput(label3),
                style: TextStyle(fontSize: 15),
              ),
              Divider(),
              //Descripcion
              TextFormField(
                cursorColor: kMorado,
                controller: descripcionController,
                decoration: decorationInput(label5),
                style: TextStyle(fontSize: 15),
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
                      'Agregar Curso',
                      style: TextStyle(color: kRosa),
                    ),
                    onPressed: () async {
                      String codigo = codigoController.text.toString();
                      String nombre = nombreController.text;
                      var grado = gradoController.text;
                      String descripcion = descripcionController.text;

                      var res = await CursosProvider()
                          .cursoAgregar(codigo, nombre, grado, descripcion);
                      if (res.isEmpty) {
                        print(res);
                        //Aqui un Snackbar
                        showSnackbar(' $nombre No Se Ha Podido Agregar');
                      } else {
                        showSnackbar(' $nombre Agregad@');
                        Navigator.pop(context);
                      }
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

  void showSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }
}
