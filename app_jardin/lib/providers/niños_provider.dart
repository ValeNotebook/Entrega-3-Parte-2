import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NinosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getNinos() async {
    var uri = Uri.parse('$apiURL/ninos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> ninosAgregar(String rut_nino,
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
          'genero': genero,
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> ninosBorrar(String rut_nino) async {
    var uri = Uri.parse('$apiURL/ninos/$rut_nino');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
