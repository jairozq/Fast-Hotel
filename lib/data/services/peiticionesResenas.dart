import 'package:fasthotel/domain/models/resena.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesResenas {
  static Future<List<Mensajes>> registrarResena(
    String idHotel,
    String resena,
    String estrellas,
  ) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/agregarResena.php");
    final response = await http.post(url, body: {
      'idHotel': idHotel,
      'resena': resena,
      'estrellas': estrellas,
    });

    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Resena>> listarResenaP(String idHotel) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/consultarResenaP.php");
    final response = await http.post(url, body: {'idHotel': idHotel});

    print(response.statusCode);
    print(response.body);

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Resena>> listarResenaN(String idHotel) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/consultarResenaN.php");
    final response = await http.post(url, body: {'idHotel': idHotel});

    return compute(convertirAlista2, response.body);
  }

  static List<Resena> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Resena>((json) => Resena.desdeJson(json)).toList();
  }
}
