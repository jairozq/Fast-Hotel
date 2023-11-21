import 'package:fasthotel/domain/models/servicios.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesServicios {
  static Future<List<Mensajes>> agregarServicios(
      String numero, String idhotel, String listservices) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/agregarServicios.php");
    final response = await http.post(url, body: {
      'numero': numero,
      'idhotel': idhotel,
      'listservices': listservices,
    });
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Servicios>> listarServicios(
      String numero, String idhotel) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/listaServiciosHab.php");
    final response = await http.post(url, body: {'idhotel': idhotel});

    return compute(convertirAlista2, response.body);
  }

  static List<Servicios> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Servicios>((json) => Servicios.desdeJson(json)).toList();
  }
}
