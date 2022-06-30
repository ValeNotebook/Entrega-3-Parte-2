// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:app_jardin/Formularios/form_niveles.dart';
import 'package:app_jardin/editar/editar_curso.dart';

import 'package:app_jardin/niveles/niveles_listado_alumnos.dart';
import 'package:app_jardin/providers/cursos_provider.dart';
import 'package:app_jardin/providers/eventos_provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

import '../niveles/niveles_listado_educadoras.dart';

class ListarNiveles extends StatefulWidget {
  ListarNiveles({Key? key}) : super(key: key);

  @override
  State<ListarNiveles> createState() => _ListarNivelesState();
}

class _ListarNivelesState extends State<ListarNiveles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Listado y Gestion De Cursos',
            style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
          ),
          actions: <Widget>[
            IconButton(
              color: kMorado,
              icon: FaIcon(FontAwesomeIcons.plus),
              tooltip: 'Agregar Niveles',
              onPressed: () {
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (context) => FormNiveles()))
                    .then((_) => setState(() {}));
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: CursosProvider().getCursos(),
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
              var nivel = snap.data[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                color: kVioleta,
                elevation: 0,
                child: ListTile(
                  title: Text((nivel['cod_curso']).toString()),
                  subtitle:
                      Text(nivel['nombre_curso'] + '\n' + nivel['descripcion']),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        tooltip: 'Listado Educadoras',
                        icon: FaIcon(
                          FontAwesomeIcons.addressBook,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) =>
                                      NiveleslistadoEducadoras(
                                          nivel['cod_curso'])))
                              .then((_) => setState(() {}));
                        },
                      ),
                      IconButton(
                        tooltip: 'Listado Alumnos',
                        icon: FaIcon(FontAwesomeIcons.childReaching),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => NivelesListadoAlumnos(
                                      nivel['cod_curso'])))
                              .then((_) => setState(() {}));
                        },
                      ),
                      IconButton(
                        tooltip: 'Editar',
                        icon: FaIcon(FontAwesomeIcons.penToSquare),
                        onPressed: () {
                          //Aqui va el editar
                          print(nivel['cod_curso']);

                          MaterialPageRoute ruta2 =
                              MaterialPageRoute(builder: (context) {
                            return EditarCursos(nivel['cod_curso']);
                          });
                          //print('llega hasta aqui');
                          Navigator.push(context, ruta2).then((value) {
                            setState(() {});
                          });
                        },
                      ),
                      IconButton(
                        tooltip: 'Eliminar',
                        icon: FaIcon(FontAwesomeIcons.trashCan),
                        onPressed: () {
                          String codigo = nivel['cod_curso'];

                          confirmDialog(context, codigo).then((confirma) {
                            if (confirma) {
                              //borrar
                              CursosProvider()
                                  .cursosBorrar(codigo)
                                  .then((borradoOk) {
                                if (borradoOk) {
                                  //pudo borrar
                                  snap.data.removeAt(index);
                                  setState(() {});
                                  showSnackbar(
                                      'Nivel de codigo $codigo Borrado');
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

  Future<dynamic> confirmDialog(BuildContext context, String codigo) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el Nivel De Codigo $codigo?'),
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
