import 'package:app_jardin/Listar/listar_alumnos.dart';
import 'package:app_jardin/Listar/listar_alumnos_dos.dart';
import 'package:app_jardin/Listar/listar_educadoras.dart';
import 'package:app_jardin/Listar/listar_eventos_totales.dart';
import 'package:app_jardin/Listar/listar_niveles.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_jardin/paleta_colores.dart';
import 'package:app_jardin/providers/niños_provider.dart';
import 'package:app_jardin/Formularios/form_alumnos.dart';

class NavigatorBar extends StatefulWidget {
  NavigatorBar({Key? key}) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  var kSeleccion = Colors.white;

  //Recomiendo usar solo Stateful
  final screens = [
    //Aqui Iran Las Paginas a Navegar
    ListarAlumnosDos(),
    ListarEventos(),
    ListarEducadoras(),
    ListarNiveles(),
    ListarAlumnos(),

    //Luego en el scafolld, utilizar
    //body : screens[indexs]
    //Quizas utilizar SafeArea en vez de Scafolld, a evaluar
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      FaIcon(FontAwesomeIcons.childReaching, size: 25),
      // ignore: deprecated_member_use
      FaIcon(
        FontAwesomeIcons.calendar,
        size: 25,
      ),
      FaIcon(FontAwesomeIcons.addressBook, size: 25),
      FaIcon(FontAwesomeIcons.rainbow, size: 25),
      FaIcon(FontAwesomeIcons.user, size: 25),
    ];

    return Scaffold(
      backgroundColor: kCeleste,
      appBar: AppBar(
        title: Text(
          'Jardin De Niños Arcoiris',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kMorado,
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white),
            primaryColor: kAmarillo),
        child: CurvedNavigationBar(
          color: kMorado,
          buttonBackgroundColor: kMorado,
          height: 60,
          backgroundColor: Colors.transparent,
          index: index,
          items: items,
          onTap: (index) => setState(
            () {
              this.index = index;
            },
          ),
        ),
      ),
    );
  }
}

//Para navegar al OnPressed
//final navigationState = navigationKey.currentState!;
// navigationState.setPage(0);
