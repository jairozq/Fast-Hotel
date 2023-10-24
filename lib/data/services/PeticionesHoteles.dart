import 'package:fasthotel/domain/models/utiles.dart';
import 'package:fasthotel/domain/models/hotel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesHotel {
  static Future<List<Mensajes>> registrarHotel(String nombre, String direccion,
      String habitaciones, String? foto) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/agregarHotel.php");
    final response = await http.post(url, body: {
      'nombre': nombre,
      'direccion': direccion,
      'habitaciones': habitaciones,
      'foto': foto
    });
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Hotel>> validarHotel(String user, String pass) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/validarHotel.php");

    final response =
        await http.post(url, body: {'user': user, 'password': pass});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Hotel>> listarHoteles() async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/listaHotelGeneral.php");

    final response = await http.get(url);
    return compute(convertirAlista2, response.body);
  }

  static Future<List<Hotel>> filtrarHoteles(String nombre) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/filtrarHotel.php");
    final response = await http.post(url, body: {'nombre': nombre});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Hotel>> buscarHoteles(String idhotel) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/buscarHotel.php");
    final response = await http.post(url, body: {'idhotel': idhotel});

    return compute(convertirAlista2, response.body);
  }

  static List<Hotel> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Hotel>((json) => Hotel.desdeJson(json)).toList();
  }
}
