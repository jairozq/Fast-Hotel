import 'package:fasthotel/domain/controller/controllerHabitacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHabitaciones extends StatefulWidget {
  const ListHabitaciones({super.key});

  @override
  State<ListHabitaciones> createState() => _ListHabitacionesState();
}

class _ListHabitacionesState extends State<ListHabitaciones> {
  ControlHabitaciones controlc = Get.put(ControlHabitaciones());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
    );
  }
}
