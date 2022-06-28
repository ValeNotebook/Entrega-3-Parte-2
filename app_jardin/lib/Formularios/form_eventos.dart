import 'package:app_jardin/providers/eventos_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class FormEventos extends StatefulWidget {
  String something;

  FormEventos(this.something);
  @override
  State<StatefulWidget> createState() {
    return FormEventosState(this.something);
  }
}

class FormEventosState extends State<FormEventos> {
  String something;

  FormEventosState(this.something);

  final formKey = GlobalKey<FormState>();

  //Falta validar que existen los alumnos, y traer los datos
  TextEditingController tiaController = TextEditingController();
  TextEditingController ninoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  String label2 = 'Nino';
  String label3 = 'Tia';
  String label4 = 'Descripcion';

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
              'Formulario Ingreso Evento',
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
      //Aqui Inician Los Formularios
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                cursorColor: kMorado,
                initialValue: something,
                readOnly: true,
                keyboardType: TextInputType.number,
                //controller: ninoController,
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
                style: TextStyle(
                  fontSize: 15,
                  color: kMorado,
                ),
              ),
              Divider(),
              TextFormField(
                cursorColor: kMorado,
                controller: descripcionController,
                decoration: decorationInput(label4),
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
                      'Agregar Evento',
                      style: TextStyle(color: kRosa),
                    ),
                    onPressed: () async {
                      //String nino = ninoController.text.toString();
                      String tia = tiaController.text.toString();
                      String descripcion = descripcionController.text;

                      var res = await EventosProvider()
                          .eventosAgregar(something, tia, descripcion);
                      if (res.isEmpty) {
                        print(res);
                        //Aqui un Snackbar
                        showSnackbar(' $descripcion No Se Ha Podido Agregar');
                      } else {
                        showSnackbar(' $descripcion Agregad@');
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

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el Evento $evento?'),
          actions: [
            TextButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('ACEPTAR'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
