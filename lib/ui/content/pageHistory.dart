import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  ControlTicket controlt = Get.put(ControlTicket());

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
                  onPressed: () {}, child: const Text("Vigentes")),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.5,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text("Vencidas")),
            ),
          ]),
        ),
      ]),
    );
  }
}
