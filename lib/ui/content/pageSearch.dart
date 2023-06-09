import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/ui/content/pageHistory.dart';
import 'package:fasthotel/ui/content/pageHome.dart';
import 'package:fasthotel/ui/content/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ListHoteles extends StatefulWidget {
  final String dato;
  const ListHoteles({super.key, required this.dato});

  @override
  State<ListHoteles> createState() => _ListHotelesState();
}

String? actualpage;

class _ListHotelesState extends State<ListHoteles> {
  @override
  Widget build(BuildContext context) {
    ControlHotel controlh = Get.put(ControlHotel());
    TextEditingController search = TextEditingController();

    decodeimage(imagen) {
      var imagen64 = (imagen).split(",")[1];
      var foto = base64Decode(imagen64);
      return foto;
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2, bottom: 10),
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextField(
              controller: search,
              maxLines: 1,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.01),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    controlh.filterHotels(search.text).then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePage())));
                  },
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Buscar...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          controlh.listarHotel!.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No hay resultados",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.width * 0.08),
                  ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: controlh.listarHotel!.length,
                    itemBuilder: (BuildContext context, int idex) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Image.memory(decodeimage(
                                        controlh.listarHotel![idex].imagen)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              controlh
                                                  .searchHotels(controlh
                                                      .listarHotel![idex]
                                                      .direccion)
                                                  .then((value) => Routes(
                                                        index: 1,
                                                        dato: dato!,
                                                      ));
                                            },
                                            child: Text("Resevar",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                    fontFamily: 'alkbold'))),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(controlh.listarHotel![idex].nombre,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045,
                                              fontFamily: 'alkbold')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          controlh
                                              .listarHotel![idex].descripcion,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
    );
  }
}
