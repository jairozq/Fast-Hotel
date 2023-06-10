import 'dart:convert';
import 'package:fasthotel/domain/models/access.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesAccess {
  static Future<List<Mensajes>> registrarAccessUser(
      String cedula, String user, String pass) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/agregarAccess.php");
    final response = await http.post(url, body: {
      'iduser': cedula,
      'user': user,
      'password': pass,
      'tipocuenta': 'C'
    });
    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> registrarAccessHotel(
      String direccion, String user, String pass) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/agregarAccess.php");
    final response = await http.post(url, body: {
      'iduser': direccion,
      'user': user,
      'password': pass,
      'tipocuenta': 'H'
    });

    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Access>> validarAccess(String user, String pass) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/validarAccess.php");
    final response = await http.post(url, body: {'user': user, 'pass': pass});

    return compute(convertirAlista2, response.body);
  }

  static List<Access> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Access>((json) => Access.desdeJson(json)).toList();
  }
}
