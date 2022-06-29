// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EducadorasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Get Todas las Educadoras

  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //get 1 educadora version Pedro
  Future<LinkedHashMap<String, dynamic>> getTia(String rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> educadoraAgregar(
      String rut_educadora, String nombre_tia, String apellido) async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'rut_educadora': rut_educadora,
        'nombre_tia': nombre_tia,
        'apellido': apellido,
      }),
    );
    return json.decode(respuesta.body);
  }
  //Delete 1 Educadora

  Future<bool> educadorasBorrar(String rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> tiasEditar(String rut_educadora,
      String rut_educadora_nuevo, String nombre_tia, String apellido) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'rut_educadora_nuevo': rut_educadora_nuevo,
          'nombre_tia': nombre_tia,
          'apellido': apellido
        }));

    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> educadoraEditarCurso(
      String rut_educadora, String cod_curso) async {
    var uri = Uri.parse('$apiURL/educadoras/$rut_educadora/post/$cod_curso');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(
          <String, dynamic>{
            'rut_educadora': rut_educadora,
            'cod_curso': cod_curso,
          },
        ));

    return json.decode(respuesta.body);
  }
}
