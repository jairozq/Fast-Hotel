import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class hotelResults extends StatefulWidget {
  const hotelResults({super.key});

  @override
  State<hotelResults> createState() => _hotelResultsState();
}

class _hotelResultsState extends State<hotelResults> {
  @override
  Widget build(BuildContext context) {
    ControlHotel controlh = Get.put(ControlHotel());
    TextEditingController search = TextEditingController();

    return Container(
      child: ListView.builder(
        itemCount: controlh.listarHotel!.length,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 255),
            appBar: AppBar(
              title: const Text('FastHotel',
                  style: TextStyle(color: Colors.white, fontFamily: 'alkbold')),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      //TextFormField(controller: ,);
                      Get.toNamed("/resultdahotels");
                    },
                    icon: const Icon(Icons.search_rounded),
                    label: const Text('',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'alkbold')),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 174, 187))),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
