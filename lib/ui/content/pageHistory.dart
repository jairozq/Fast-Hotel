import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart';

class ListHistory extends StatefulWidget {
  final String dato;
  const ListHistory({super.key, required this.dato});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

String? dato;

class _ListHistoryState extends State<ListHistory> {
  ControlTicket controlt = Get.put(ControlTicket());

  cargarDatos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("estoy ${pref.getString("idG")}");
    dato = pref.getString("idG");
    print("paso a $dato");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.058,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.5,
              child: OutlinedButton(
                  onPressed: () {
                    cargarDatos();
                  },
                  child: const Text("Vigentes")),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.5,
              child: OutlinedButton(
                  onPressed: () {
                    cargarDatos();
                  },
                  child: const Text("Vencidas")),
            ),
          ]),
        ),
      ]),
    );
  }
}
