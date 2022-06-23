import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class ListarAlumnos extends StatefulWidget {
  ListarAlumnos({Key? key}) : super(key: key);

  @override
  State<ListarAlumnos> createState() => _ListarAlumnosState();
}

class _ListarAlumnosState extends State<ListarAlumnos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAzul,
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
              color: kAmarillo,
            ),
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              var nino = snap.data[index];
              return Card(
                color: kVerde,
                elevation: 0,
                child: ListTile(
                  title: Text(nino['nombre_nino']),
                  subtitle: Text(nino['rut_nino']),
                  trailing: FaIcon(
                    FontAwesomeIcons.trash,
                    size: 25,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
