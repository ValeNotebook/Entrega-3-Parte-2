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

  //get 1 curso version Pedro
  Future<LinkedHashMap<String, dynamic>> getCurso(String cod_curso) async {
    var uri = Uri.parse('$apiURL/curso/$cod_curso');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> cursosEditar(
    String cod_curso,
    String cod_nuevo_curso,
    String nombre_curso,
    String grado,
    String descripcion,
  ) async {
    var uri = Uri.parse('$apiURL/curso/$cod_curso');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_curso': cod_curso,
          'cod_nuevo_curso': cod_nuevo_curso,
          'nombre_curso': nombre_curso,
          'grado': grado,
          'descripcion': descripcion,
        }));

    return json.decode(respuesta.body);
  }

  //Curso Agregar

  Future<LinkedHashMap<String, dynamic>> cursoAgregar(
      String codigo, String nombre, var grado, String descripcion) async {
    var uri = Uri.parse('$apiURL/curso');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'cod_curso': codigo,
        'nombre_curso': nombre,
        'grado': grado,
        'descripcion': descripcion,
      }),
    );
    return json.decode(respuesta.body);
  }

  //Borrar un solo curso
  Future<bool> cursosBorrar(String cod_curso) async {
    var uri = Uri.parse('$apiURL/curso/$cod_curso');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
