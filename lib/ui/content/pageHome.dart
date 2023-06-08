import 'dart:convert';
import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHoteles extends StatefulWidget {
  const ListHoteles({super.key});

  @override
  State<ListHoteles> createState() => _ListHotelesState();
}

String? actualpage;

class _ListHotelesState extends State<ListHoteles> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    void onItemTapped(int index) {
      setState(() {
        actualpage = "$index";
      });
    }

    decodeimage(imagen) {
      var imagen64 = (imagen).split(",")[1];
      var foto = base64Decode(imagen64);
      return foto;
    }

    ControlHotel controlh = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('FastHotel',
            style: TextStyle(color: Colors.white, fontFamily: 'alkbold')),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.156,
            child: OutlinedButton.icon(
                onPressed: () {
                  Get.toNamed("/login");
                },
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                label: const Text('',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'alkbold'))),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(border: Border.all()),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Wrap(
              children: [
                TextField(
                  controller: search,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.05),
                    suffixIcon: Icon(Icons.search_rounded),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controlh.listarHotel!.length,
              itemBuilder: (BuildContext context, int idex) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Image.memory(decodeimage(
                                  controlh.listarHotel![idex].imagen)),
                            ),
                            Row(
                              children: [
                                Text(controlh.listarHotel![idex].nombre,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        fontFamily: 'alkbold')),
                              ],
                            ),
                            Row(
                              children: [
                                Text(controlh.listarHotel![idex].descripcion,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontFamily: 'alkreg')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      //menu inferior
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        selectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        selectedFontSize: MediaQuery.of(context).size.width * 0.04,
        unselectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        unselectedFontSize: MediaQuery.of(context).size.width * 0.03,
        currentIndex: actualpage == null ? 0 : int.parse(actualpage!),
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: "Reservas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Perfil",
          ),
        ],
      ), //fin menu
    );
  }
}


/*TextFormField(controller: busqueda,
              decoration: InputDecoration(
                hintText: 'Buscar',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              ); */