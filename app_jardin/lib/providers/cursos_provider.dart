import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CursosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Get Todos Los Cursos
  Future<List<dynamic>> getCursos() async {
    var uri = Uri.parse('$apiURL/curso');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //Borrar un solo curso
  Future<bool> cursosBorrar(String cod_curso) async {
    var uri = Uri.parse('$apiURL/curso/$cod_curso');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
