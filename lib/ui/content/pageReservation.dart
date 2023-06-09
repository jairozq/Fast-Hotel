import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/ui/content/pageHistory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reservar extends StatefulWidget {
  final String dato;
  const Reservar({super.key, required this.dato});

  @override
  State<Reservar> createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
  ControlHotel controlh = Get.put(ControlHotel());
  TextEditingController habitacion = TextEditingController();
  TextEditingController idUser = TextEditingController();
  TextEditingController nombreHotel = TextEditingController();
  TextEditingController idHotel = TextEditingController();
  TextEditingController detalle = TextEditingController();
  TextEditingController fechaInicio = TextEditingController();
  TextEditingController fechaFinal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: controlh.listarHotel![0].nombre,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: controlh.listarHotel![0].direccion,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Habitacion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: dato,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Detalle',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Fecha de Inicio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: nombreHotel,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Fecha de Finalizacion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                child: OutlinedButton(
                    onPressed: () {}, child: const Text("Registrar")),
              ),
            ],
          );
        },
      ),
    );
  }
}
