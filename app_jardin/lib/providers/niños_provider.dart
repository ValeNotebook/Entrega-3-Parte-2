// ignore_for_file: non_constant_identifier_names, unnecessary_new

import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NinosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

//Get todos los ninos

  Future<List<dynamic>> getNinos() async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

//Agregar Nino

  Future<LinkedHashMap<String, dynamic>> ninosAgregar(String rut_nino,
      String nombre_nino, String apellido, String genero) async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'rut_nino': rut_nino,
        'nombre_nino': nombre_nino,
        'apellido': apellido,
        'genero': genero,
      }),
    );
    return json.decode(respuesta.body);
  }

  //buscar 1 niño

  Future<LinkedHashMap<String, dynamic>> getNino(String rut_nino) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

//Agregar niño

  Future<LinkedHashMap<String, dynamic>> NinosAgregar(String rut_nino,
      String nombre_nino, String apellido, String genero) async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'nombre_nino': nombre_nino,
          'apellido': apellido,
          'genero': genero
        }));

    return json.decode(respuesta.body);
  }

  //modificar
  Future<LinkedHashMap<String, dynamic>> NinosEditar(
      String rut_nino,
      String rut_nuevo_nino,
      String nombre_nino,
      String apellido,
      String genero) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'rut_nuevo_nino': rut_nuevo_nino,
          'nombre_nino': nombre_nino,
          'apellido': apellido,
          'genero': genero
        }));

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> ninoEditarCurso(
      String rut_nino, String cod_curso) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino/post/$cod_curso');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'cod_curso': cod_curso,
        }));

    return json.decode(respuesta.body);
  }

  Future<bool> ninosBorrar(String rut_nino) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
