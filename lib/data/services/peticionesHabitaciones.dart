import 'package:fasthotel/domain/models/habitacion.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesHabitaciones {
  static Future<List<Mensajes>> crearHabitaciones(
      String numero, String idhotel) async {
    var url = Uri.parse(
        "https://fatshotel.000webhostapp.com/agregarHabitaciones.php");
    final response = await http.post(url, body: {
      'numero': numero,
      'idhotel': idhotel,
    });
    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> cambiarEstadoHabitaciones(String estado) async {
    var url = Uri.parse(
        "https://fatshotel.000webhostapp.com/cambiarEstadoHabitaciones.php");
    final response = await http.post(url, body: {'estado': estado});
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Habitaciones>> listaHabitaciones(String idhotel) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/listaHabitaciones.php");
    final response = await http.post(url, body: {'idhotel': idhotel});

    return compute(convertirAlista2, response.body);
  }

  static List<Habitaciones> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar
        .map<Habitaciones>((json) => Habitaciones.desdeJson(json))
        .toList();
  }
}
