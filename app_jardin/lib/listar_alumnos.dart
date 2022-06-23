import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';

class ListarAlumnos extends StatefulWidget {
  ListarAlumnos({Key? key}) : super(key: key);

  @override
  State<ListarAlumnos> createState() => _ListarAlumnosState();
}

class _ListarAlumnosState extends State<ListarAlumnos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            FutureBuilder(
              future: NinosProvider().getNinos(),
              builder: (context, AsyncSnapshot snap) {
                if (!snap.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    var nino = snap.data[index];
                    return ListTile(
                      title: Text(nino['nombre_nino']),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
