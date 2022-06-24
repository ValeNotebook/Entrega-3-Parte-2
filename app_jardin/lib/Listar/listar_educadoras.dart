import 'package:app_jardin/providers/educadoras_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';

class ListarEducadoras extends StatefulWidget {
  ListarEducadoras({Key? key}) : super(key: key);

  @override
  State<ListarEducadoras> createState() => _ListarEducadorasState();
}

class _ListarEducadorasState extends State<ListarEducadoras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeleste,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kRosa,
          title: Text(
            'Educadoras',
            style: TextStyle(fontWeight: FontWeight.bold, color: kMorado),
          ),
          actions: <Widget>[
            IconButton(
              color: kMorado,
              icon: FaIcon(FontAwesomeIcons.plus),
              tooltip: 'Agregar Educadora',
              onPressed: () {},
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: EducadorasProvider().getEducadoras(),
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
              var educadora = snap.data[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                color: kVioleta,
                elevation: 0,
                child: ListTile(
                  title: Text(educadora['nombre_tia']),
                  subtitle: Text(educadora['rut_educadora']),
                  trailing: Wrap(spacing: 12, children: <Widget>[
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.penToSquare),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.trashCan),
                      onPressed: () {},
                    ),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
