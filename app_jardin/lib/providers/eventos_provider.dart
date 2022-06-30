import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var uri = Uri.parse('$apiURL/eventos');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getEventoByNino(nino) async {
    var uri = Uri.parse('$apiURL/eventos/get/nino?filtro=$nino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getEvento(int cod_evento) async {
    var uri = Uri.parse('$apiURL/eventos/get/cod_evento?filtro=$cod_evento');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> eventosAgregar(
      String nino, String tia, String descripcion) async {
    var uri = Uri.parse('$apiURL/eventos');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'nino': nino,
        'tia': tia,
        'descripcion': descripcion,
      }),
    );
    return json.decode(respuesta.body);
  }

//No se para que es esto pero no lo tocare por si acaso
  Future<LinkedHashMap<String, dynamic>> eventosEditar(
      int cod_evento, String nino, String tia, String descripcion) async {
    var uri = Uri.parse('$apiURL/eventos/$cod_evento');
    var respuesta = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, dynamic>{
        'nino': nino,
        'tia': tia,
        'descripcion': descripcion,
      }),
    );
    return json.decode(respuesta.body);
  }

  //modificar
  Future<LinkedHashMap<String, dynamic>> eventoModificar(
    int cod_evento,
    String nino,
    String tia,
    String descripcion,
  ) async {
    var uri = Uri.parse('$apiURL/eventos/$cod_evento');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_evento': cod_evento,
          'nino': nino,
          'tia': tia,
          'descripcion': descripcion,
        }));

    return json.decode(respuesta.body);
  }

  Future<bool> eventossBorrar(int cod_evento) async {
    var uri = Uri.parse('$apiURL/eventos/$cod_evento');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
