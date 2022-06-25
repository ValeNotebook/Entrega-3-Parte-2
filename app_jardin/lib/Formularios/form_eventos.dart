import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class FormEventos extends StatefulWidget {
  FormEventos({Key? key}) : super(key: key);

  @override
  State<FormEventos> createState() => _FormEventosState();
}

class _FormEventosState extends State<FormEventos> {
  final formKey = GlobalKey<FormState>();

  TextEditingController codigoController = TextEditingController();
  TextEditingController gradoController = TextEditingController();
  TextEditingController ninoController = TextEditingController();
  TextEditingController tiaController = TextEditingController();

  String label1 = 'Rut';
  String label2 = 'Nombre';
  String label3 = 'Apellido';

  String rutValue = '';
  String nombreValue = '';
  String apellidoValue = '';
  String generoValue = '';

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
                controller: tiaController,
                decoration: decorationInput(label1),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              TextFormField(
                cursorColor: kMorado,
                controller: tiaController,
                decoration: decorationInput(label2),
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              TextFormField(
                cursorColor: kMorado,
                controller: tiaController,
                decoration: decorationInput(label3),
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
                      'Agregar Nivel',
                      style: TextStyle(color: kRosa),
                    ),
                    onPressed: () async {
                      //String rut = rutController.text.toString();
                      //String nombre = nombreController.text;
                      //String apellido = apellidoController.text;
                      //String genero = generoController.text;

                      //var res = await NinosProvider()
                      //.ninosAgregar(rut, nombre, apellido, genero);
                      //if (res.isEmpty) {
                      //print(res);
                      //Aqui un Snackbar
                      //showSnackbar(' $nombre No Se Ha Podido Agregar');
                      //} else {
                      //showSnackbar(' $nombre Agregad@');
                      //Navigator.pop(context);
                      //}
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

  void showSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }
}
