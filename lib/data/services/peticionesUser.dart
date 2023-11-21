import 'dart:convert';
import 'package:fasthotel/domain/models/user.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesUser {
  static Future<List<Mensajes>> registrarUser(
      String nombre, String cedula, String celular) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/agregarUser.php");
    final response = await http.post(url,
        body: {'nombre': nombre, 'cedula': cedula, 'celular': celular});

    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<User>> validarUser(String u, String p) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/validarUser.php");
    final response = await http.post(url, body: {'user': u, 'pass': p});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<User>> buscarUser(String id) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/buscarUser.php");
    final response = await http.post(url, body: {'iduser': id});
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<User> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
