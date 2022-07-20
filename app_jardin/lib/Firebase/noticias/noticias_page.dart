import 'package:app_jardin/Firebase/noticias/agregar_noticias_page.dart';
import 'package:app_jardin/Firebase/noticias/auth_noticias.dart';
import 'package:app_jardin/Firebase/noticias/editar_noticias_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:app_jardin/paleta_colores.dart';

class NoticiasPage extends StatefulWidget {
  NoticiasPage({Key? key}) : super(key: key);

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    int bigInt = 0;
    int total = 0;
    int total2 = 0;
    int valor_ant = 0;
    int val_may = 0;

    return Scaffold(
      backgroundColor: kCeleste,
      appBar: AppBar(
        backgroundColor: kRosa,
        title: Text(
          'Noticias',
          style: TextStyle(color: kOscuro),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FireStoreService().noticias(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                  if (!snap.hasData ||
                      snap.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var noticia = snap.data!.docs[index];

                        bigInt = 0;

                        //combierte fecha formato timestamp en datetime

                        var fecha = DateTime.fromMillisecondsSinceEpoch(
                                noticia['fecha'].seconds * 1000,
                                isUtc: true)
                            .format('dd-MMMM-yyyy', 'es' 'ES');

                        //la manera mas simple de hacer un campo id autoincremental
                        total = snap.data!.docs.length;
                        print('valor actual de total');
                        print(total);
                        print('id ');
                        print(noticia['noticia_id']);

                        valor_ant = noticia['noticia_id'];
                        if (valor_ant >= val_may) {
                          val_may = valor_ant;
                        }

                        // print('valor mayor final');
                        // print(val_may);
                        // bigInt = val_may;
                        return Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Card(
                              margin: EdgeInsets.all(10.0),
                              color: kRosa,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceTint),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.menu_book_sharp,
                                      color: kOscuro,
                                    ),
                                    title: Text(
                                      '${noticia['titulo']}',
                                      style: TextStyle(color: kOscuro),
                                    ),
                                    subtitle: Text(
                                        DateTime.fromMillisecondsSinceEpoch(
                                                noticia['fecha'].seconds * 1000,
                                                isUtc: true)
                                            .timeago(locale: 'es')),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              backgroundColor: kCeleste,
                                              title: Text(
                                                '${noticia['titulo']}',
                                                style:
                                                    TextStyle(color: kOscuro),
                                              ),
                                              children: [
                                                Divider(),
                                                ListTile(
                                                  title: Text(
                                                      'Publicado :' +
                                                          ' ' +
                                                          fecha,
                                                      style: TextStyle(
                                                          fontSize: 15)),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                      noticia['descripcion']),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              MaterialPageRoute route =
                                                  MaterialPageRoute(
                                                builder: (context) =>
                                                    NoticiasEditar(noticia.id),
                                              );
                                              Navigator.push(context, route);
                                            },
                                            child: Text(
                                              'Editar',
                                              style: TextStyle(color: kOscuro),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              // FirestoreService().noticiasBorrar(
                                              //     noticia['noticia_id']);
                                              FireStoreService()
                                                  .noticiasBorrar(noticia.id);
                                            },
                                            child: Text('Eliminar',
                                                style:
                                                    TextStyle(color: kOscuro)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: snap.data!.docs.length);
                }),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kMorado,
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  MaterialPageRoute ruta =
                      MaterialPageRoute(builder: (context) {
                    return NoticiasAgregarPage(bigInt);
                  });

                  Navigator.push(context, ruta).then((value) {
                    print('ACTUALIZAR PAGINA');
                    setState(() {});
                  });
                },
                child: Text('Agregar')),
          ),
          Divider(
            thickness: 15,
          )
        ],
      ),
    );
  }
}
