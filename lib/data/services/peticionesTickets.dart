import 'dart:convert';
import 'package:fasthotel/domain/models/tickets.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesTicket {
  static Future<List<Mensajes>> registrarTicket(
      String habtacion,
      String idUser,
      String nombreHotel,
      String idHotel,
      String detalle,
      String fechaInicio,
      String fechaFinal) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/agregarTicket.php");
    final response = await http.post(url, body: {
      'habitacion': habtacion,
      'iduser': idUser,
      'nombrehotel': nombreHotel,
      'idhotel': idHotel,
      'detalle': detalle,
      'fechainicio': fechaInicio,
      'fechafinal': fechaFinal,
      'estado': 'Vigente',
    });

    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> cancelarTicket(String ticketId) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/cancelarTicket.php");
    final response = await http.post(url, body: {'ticketId': ticketId});

    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Ticket>> listarTicketsVig(String user) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/listarTicketsVig.php");
    final response = await http.post(url, body: {'user': user});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Ticket>> listarTiketsVen(String user) async {
    var url =
        Uri.parse("https://fatshotel.000webhostapp.com/listarTicketsVen.php");
    final response = await http.post(url, body: {'user': user});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Ticket>> consultarTicket(String ticketId) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/extraerIdH.php");
    final response = await http.post(url, body: {'ticketId': ticketId});

    return compute(convertirAlista2, response.body);
  }

  static List<Ticket> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Ticket>((json) => Ticket.desdeJson(json)).toList();
  }
}
