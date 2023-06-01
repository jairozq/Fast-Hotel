import 'dart:convert';
import 'package:fasthotel/domain/models/hotel.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeticionesHotel {
  static Future<List<Mensajes>> registrarHotel(String nombre, String direccion,
      String descripcion, String habitaciones, String? foto) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/agregarHotel.php");
    final response = await http.post(url, body: {
      'nombre': nombre,
      'direccion': direccion,
      'descripcion': descripcion,
      'habitaciones': habitaciones,
      'foto': foto
    });
    print(response.statusCode);
    print(response);
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

  static List<Hotel> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Hotel>((json) => Hotel.desdeJson(json)).toList();
  }

  static Future<List<Hotel>> obtenerId(String user) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/extraerIdH.php");

    final response = await http.post(url, body: {'user': user});

    return compute(convertirAlista2, response.body);
  }
}