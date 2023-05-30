import 'dart:convert';
import 'package:fasthotel/domain/models/hotel.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:io';


class PeticionesHotel {
  static Future<List<Mensajes>> registrarHotel(
      String nombre, String direccion, String descripcion, String habitaciones, String? foto) async {
    /*Dio dio = Dio();
    String filename = foto!.path.split('/').last;

    FormData formdata = FormData.fromMap({'nombre': nombre, 'direccion': direccion, 'descripcion': descripcion, 'habitaciones': habitaciones,
      "file" : await MultipartFile.fromFile(
        foto.path, filename: filename)
    });*/
    print('Aqui estoy');
    print('$foto');
    var url = Uri.parse("https://fatshotel.000webhostapp.com/agregarHotel.php");
    final response = await http.post(url, body: {'nombre': nombre, 'direccion': direccion, 'descripcion': descripcion, 'habitaciones': habitaciones, 'foto': foto});
    print(response.statusCode);
    print(response);
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<Hotel>> validarHotel(String user, String pass) async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/validarHotel.php");

    final response = await http.post(url, body: {'user': user, 'password': pass});

    return compute(convertirAlista2, response.body);
  }

  static Future<List<Hotel>> listarHoteles() async {
    var url = Uri.parse("https://fatshotel.000webhostapp.com/listaHotelGeneral.php");

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
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


/*var request =http.MultipartRequest('POST',url);
    request.fields['nombre']=nombre;
    request.fields['direccion']=direccion;
    request.fields['descripcion']=descripcion;
    request.fields['habitaciones']=habitaciones;
    var pic = await http.MultipartFile.fromPath("image", foto!.path);
    request.files.add(pic);
    //final response = await request.send();*/