// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:app_jardin/Formularios/form_alumnos.dart';
import 'package:app_jardin/Listar/listar_eventos_alumno.dart';
import 'package:app_jardin/editar/editar_educadoras.dart';
import 'package:app_jardin/editar/editar_ninos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

enum Menu {
  itemOne,
  itemTwo,
}

class ListarAlumnos extends StatefulWidget {
  ListarAlumnos({Key? key}) : super(key: key);

  @override
  State<ListarAlumnos> createState() => _ListarAlumnosState();
}

class _ListarAlumnosState extends State<ListarAlumnos> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Listado Niños y Niñas Del Jardin',
            style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
          ),
          actions: <Widget>[
            IconButton(
              color: kMorado,
              icon: FaIcon(FontAwesomeIcons.plus),
              tooltip: 'Agregar Niños',
              onPressed: () {
                //Push y setState luego de agregar Alumno
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (context) => FormAlumnos()))
                    .then((_) => setState(() {}));
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: NinosProvider().getNinos(),
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
              var nino = snap.data[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                color: kVioleta,
                elevation: 0,
                child: SizedBox(
                  //width: 100,
                  //height: 200,
                  child: Column(
                    children: [
                      ListTile(
                          leading: CircleAvatar(
                              backgroundColor: kCeleste,
                              child: ClipRRect(
                                //child: Image.asset(' '),
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          title: Text(
                              nino['nombre_nino'] + ' ' + nino['apellido']),
                          subtitle: Text(nino['rut_nino']),
                          trailing: PopupMenuButton<Menu>(
                            onSelected: (Menu item) {
                              setState(() {
                                _selectedMenu = item.name;
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<Menu>>[
                              PopupMenuItem<Menu>(
                                value: Menu.itemOne,
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            MaterialPageRoute ruta2 =
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return EditarNinos(
                                                  nino['rut_nino'],
                                                  nino['nombre_nino']);
                                            });
                                            //print('llega hasta aqui');
                                            Navigator.push(context, ruta2)
                                                .then((value) {
                                              setState(() {});
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              // Icon(FontAwesomeIcons.penToSquare),
                                              Text(
                                                'Editar',
                                                style:
                                                    TextStyle(color: kMorado),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem<Menu>(
                                value: Menu.itemTwo,
                                child: Center(
                                  child: Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            String rutnino = nino['rut_nino'];
                                            String nombre = nino['nombre_nino'];
                                            confirmDialog(context, nombre)
                                                .then((confirma) {
                                              if (confirma) {
                                                //borrar
                                                NinosProvider()
                                                    .ninosBorrar(rutnino)
                                                    .then((borradoOk) {
                                                  if (borradoOk) {
                                                    //pudo borrar
                                                    snap.data.removeAt(index);
                                                    setState(() {});
                                                    showSnackbar(
                                                        'Educadora $nombre Borrada');
                                                  } else {
                                                    //no pudo borrar
                                                    showSnackbar(
                                                        'No se pudo borrar la Educadora');
                                                  }
                                                });
                                              }
                                              ;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              //Icon(FontAwesomeIcons.trashCan),
                                              Text(
                                                'Eliminar',
                                                style:
                                                    TextStyle(color: kMorado),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Spacer(),
                      Divider(),
                      Row(
                        children: [
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) => SecondPage(
                                              nino['rut_nino'],
                                              nino['nombre_nino'])))
                                      .then((_) => setState(() {}));
                                },
                                child: Text(
                                  'Historial del Niño',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: kMorado),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ListTile(
                //   //Para la imagen del ni;o
                //   leading: CircleAvatar(
                //     backgroundColor: kCeleste,
                //     //child: ClipRRect(
                //     //child: Image.asset(' '),
                //     //borderRadius: BorderRadius.circular(50.0),
                //     //),
                //   ),
                //   title: Text(nino['nombre_nino'] + ' ' + nino['apellido']),
                //   subtitle: Text(nino['rut_nino']),
                //   trailing: Row(
                //     children: [
                //       //   IconButton(
                //       //     icon: FaIcon(FontAwesomeIcons.bookAtlas),
                //       //     onPressed: () {
                //       //       Navigator.of(context)
                //       //           .push(MaterialPageRoute(
                //       //               builder: (context) => SecondPage(
                //       //                   nino['rut_nino'], nino['nombre_nino'])))
                //       //           .then((_) => setState(() {}));
                //       //     },
                //       //   ),
                //       //   PopupMenuButton<Menu>(
                //       //       onSelected: (Menu item) {
                //       //         setState(() {
                //       //           _selectedMenu = item.name;
                //       //         });
                //       //       },
                //       //       itemBuilder: (BuildContext context) =>
                //       //           <PopupMenuEntry<Menu>>[
                //       //             PopupMenuItem<Menu>(
                //       //               value: Menu.itemOne,
                //       //               child: Expanded(
                //       //                 child: Column(
                //       //                   children: [
                //       //                     TextButton(
                //       //                       onPressed: () {
                //       //                         MaterialPageRoute ruta2 =
                //       //                             MaterialPageRoute(
                //       //                                 builder: (context) {
                //       //                           return EditarNinos(
                //       //                               nino['rut_nino']);
                //       //                         });
                //       //                         //print('llega hasta aqui');
                //       //                         Navigator.push(context, ruta2)
                //       //                             .then((value) {
                //       //                           setState(() {});
                //       //                         });
                //       //                       },
                //       //                       child: Row(
                //       //                         // ignore: prefer_const_literals_to_create_immutables
                //       //                         children: [
                //       //                           Icon(
                //       //                               FontAwesomeIcons.penToSquare),
                //       //                           Text(
                //       //                             'Editar',
                //       //                           )
                //       //                         ],
                //       //                       ),
                //       //                     ),
                //       //                     //Text('Editar'),

                //       //                     // IconButton(
                //       //                     //     onPressed: () {
                //       //                     //       MaterialPageRoute ruta2 =
                //       //                     //           MaterialPageRoute(
                //       //                     //               builder: (context) {
                //       //                     //         return EditarTias(
                //       //                     //             tias['rut_educadora']);
                //       //                     //       });
                //       //                     //       //print('llega hasta aqui');
                //       //                     //       Navigator.push(context, ruta2)
                //       //                     //           .then((value) {
                //       //                     //         setState(() {});
                //       //                     //       });
                //       //                     //     },
                //       //                     //     icon:
                //       //                     //         Icon(MdiIcons.bookArrowUp)),
                //       //                   ],
                //       //                 ),
                //       //               ),
                //       //             ),
                //       //             PopupMenuItem<Menu>(
                //       //               value: Menu.itemTwo,
                //       //               child: Expanded(
                //       //                 child: Column(
                //       //                   children: [
                //       //                     TextButton(
                //       //                       onPressed: () {},
                //       //                       child: Row(
                //       //                         // ignore: prefer_const_literals_to_create_immutables
                //       //                         children: [
                //       //                           Icon(FontAwesomeIcons.trashCan),
                //       //                           Text('Eliminar')
                //       //                         ],
                //       //                       ),
                //       //                     ),
                //       //                   ],
                //       //                 ),
                //       //               ),
                //       //               onTap: () {
                //       //                 // NavegarHaciaEliminar(context);
                //       //               },
                //       //             ),
                //       //           ]),
                //     ],
                //   ),
                // ),
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

  Future<dynamic> confirmDialog(BuildContext context, String nino) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar borrado'),
          content: Text('¿Borrar el Alumno $nino?'),
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





  // IconButton(
                          //   icon: FaIcon(FontAwesomeIcons.penToSquare),
                          //   onPressed: () {},
                          // ),
                          // IconButton(
                          //   icon: FaIcon(FontAwesomeIcons.trashCan),
                          //   onPressed: () {
                          //     String rutNino = nino['rut_nino'];
                          //     String nombre = nino['nombre_nino'];
                          //     confirmDialog(context, nombre).then((confirma) {
                          //       if (confirma) {
                          //         //borrar
                          //         NinosProvider()
                          //             .ninosBorrar(rutNino)
                          //             .then((borradoOk) {
                          //           if (borradoOk) {
                          //             //pudo borrar
                          //             snap.data.removeAt(index);
                          //             setState(() {});
                          //             showSnackbar('Alumno $nombre Borrado');
                          //           } else {
                          //             //no pudo borrar
                          //             showSnackbar('No se pudo borrar el Alumno');
                          //           }
                          //         });
                          //       }
                          //       ;
                          //     });
                          //   },
                          // ),