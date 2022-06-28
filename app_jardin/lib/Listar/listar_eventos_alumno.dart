import 'package:app_jardin/Formularios/form_eventos.dart';
import 'package:app_jardin/providers/eventos_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:app_jardin/providers/eventos_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class SecondPage extends StatefulWidget {
  String something;
  String something2;
  SecondPage(this.something, this.something2);
  @override
  State<StatefulWidget> createState() {
    return SecondPageState(this.something, this.something2);
  }
}

class SecondPageState extends State<SecondPage> {
  String something;
  String something2;
  SecondPageState(this.something, this.something2);
  //something es rut-nino
  //something es nombre_nino
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Eventos De $something2',
            style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
          ),
          actions: <Widget>[
            IconButton(
              color: kMorado,
              icon: FaIcon(FontAwesomeIcons.plus),
              tooltip: 'Formulario de Eventos y Sucesos',
              onPressed: () {
                //Push y setState luego de agregar Evento
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => FormEventos(something)))
                    .then((_) => setState(() {}));
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: EventosProvider().getEventoByNino(this.something),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(
              thickness: 0.9,
              color: kVerde,
            ),
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              var evento = snap.data[index];
              var datosCompletos =
                  EventosProvider().getEventoByNino(evento['cod_evento']);

              return Card(
                margin: EdgeInsets.all(10.0),
                color: kVioleta,
                elevation: 0,
                child: ListTile(
                  title: Text((evento['descripcion']).toString()),
                  subtitle: Text(evento['tia']),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.penToSquare),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.trashCan),
                        onPressed: () {
                          int codigo = evento['cod_evento'];
                          String cod_string = codigo.toString();
                          confirmDialog(context, codigo, cod_string)
                              .then((confirma) {
                            if (confirma) {
                              //borrar
                              EventosProvider()
                                  .eventossBorrar(codigo)
                                  .then((borradoOk) {
                                if (borradoOk) {
                                  //pudo borrar
                                  snap.data.removeAt(index);
                                  setState(() {});
                                  showSnackbar(
                                      'Evento de codigo $cod_string Borrado');
                                } else {
                                  //no pudo borrar
                                  showSnackbar('No se pudo borrar el evento');
                                }
                              });
                            }
                            ;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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

  Future<dynamic> confirmDialog(
      BuildContext context, int codigo, String cod_string) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el Evento De Codigo $cod_string?'),
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
