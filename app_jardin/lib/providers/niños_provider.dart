import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AlumnosProvider {
  final String apiURL = 'https://api.waifu.im/';

  Future<List<dynamic>> getAlumnos() async {
    var uri = Uri.parse('$apiURL/random');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      print(respuesta);
      print('HOLA SOY LA RESPUESTA AYUDA');
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }
}
