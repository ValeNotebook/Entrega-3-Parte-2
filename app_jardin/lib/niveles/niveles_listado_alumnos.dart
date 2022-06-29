// ignore_for_file: prefer_const_constructors

import 'package:app_jardin/Formularios/form_alumnos.dart';
import 'package:app_jardin/Listar/listar_eventos_alumno.dart';
import 'package:app_jardin/editar/editar_ninos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class NivelesListadoAlumnos extends StatefulWidget {
  String curso;

  NivelesListadoAlumnos(this.curso);

  @override
  State<StatefulWidget> createState() {
    return _NivelesListadoAlumnosState(curso);
  }
}

class _NivelesListadoAlumnosState extends State<NivelesListadoAlumnos> {
  String curso;

  _NivelesListadoAlumnosState(this.curso);
  String iconName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Niños y Niñas Del Curso',
            style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
          ),
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
              iconName = '';
              var nino = snap.data[index];
              if (nino['curso'] == curso) {
                iconName = 'red';
              }
              return Card(
                margin: EdgeInsets.all(10.0),
                color: kVioleta,
                elevation: 0,
                child: ListTile(
                  //Para la imagen del ni;o
                  title: Text(nino['nombre_nino'] + ' ' + nino['apellido']),
                  subtitle: Text(nino['rut_nino']),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        tooltip: 'Gestionar Alumno',
                        icon: FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: iconName == 'red'
                              ? Color(0xffB689C0)
                              : Colors.grey,
                        ),
                        onPressed: () async {
                          var nada = 'nada';

                          print('se esta apretando el boton');

                          if (nino['curso'] != curso) {
                            print('Es Curso Distinto');
                            print(curso);
                            print(nino['curso']);

                            String rut_nino = nino['rut_nino'];

                            var res = await NinosProvider()
                                .ninoEditarCurso(rut_nino, curso);

                            setState(() {});
                            showSnackbar('Alumno Agregado');

                            Navigator.pop(context);
                          }
                          if (nino['curso'] == curso) {
                            String rut_nino = nino['rut_nino'];
                            var res = await NinosProvider()
                                .ninoEditarCurso(rut_nino, nada);
                            showSnackbar('Alumno Removido');
                            Navigator.pop(context);

                            print('Es Curso Iguales');
                          }

                          setState(() {});
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
}
