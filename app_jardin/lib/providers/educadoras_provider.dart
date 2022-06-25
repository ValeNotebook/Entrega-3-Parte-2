import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EducadorasProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //Get All Educadoras

  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadoras');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
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
}
