import 'package:fasthotel/domain/controller/controllerHabitacion.dart';
import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/ui/content/hotel/listHabicaciones.dart';
import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ControlHabitaciones controlc = Get.put(ControlHabitaciones());
  ControlHotel controlh = Get.put(ControlHotel());
  TextEditingController descripcion = TextEditingController();

  decodeimage(imagen) {
    var imagen64 = (imagen).split(",")[1];
    var foto = base64Decode(imagen64);
    return foto;
  }

  cargarVista() {
    setState(() {
      idexh = 2;
    });
  }

  cargarHotel() {
    controlh.searchHotels(dato).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePageH(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (idexh != 2) {
      cargarHotel();
      cargarVista();
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.49,
            height: MediaQuery.of(context).size.width * 0.49,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan, width: 7),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: CircleAvatar(
              backgroundImage: MemoryImage(
                decodeimage(controlh.listarHotels![0].imagen),
              ),
            ),
          ),
          Container(
            child: Text(
              controlh.listarHotels![0].nombre,
              style: TextStyle(
                fontFamily: "alksemb",
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          Container(
            child: Text(
              controlh.listarHotels![0].descripcion,
              style: TextStyle(
                color: controlh.listarHotels![0].descripcion ==
                        'No hay una descripcion'
                    ? Colors.grey
                    : Colors.black,
                fontFamily: "alkreg",
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
          Container(
            child: Text(
              "ID:  ${controlh.listarHotels![0].direccion}",
              style: TextStyle(
                fontFamily: "alkreg",
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: controlh.listarHotels![0].estadohabitaciones ==
                    'No Generadas'
                ? OutlinedButton(
                    onPressed: () {
                      controlh.generarHabitaciones(
                          dato, controlh.listarHotels![0].habitaciones);
                      Get.snackbar(
                          'Habitación', controlh.listaMensajes![0].mensaje,
                          duration: const Duration(seconds: 3),
                          icon: const Icon(Icons.info),
                          shouldIconPulse: true,
                          backgroundColor: controlh.listaMensajes![0].mensaje ==
                                  'Las habitaciones han sido generadas'
                              ? Colors.green
                              : Colors.red);
                      if (controlh.listaMensajes![0].mensaje ==
                          'Las habitaciones han sido generadas') {
                        setState(() {
                          controlh.listarHotels![0].estadohabitaciones =
                              'Generadas';
                        });
                      }
                      // cargarHotel();
                    },
                    child: Text(
                      "Generar Habitaciones",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () {
                      Get.snackbar('Habitaciones',
                          "Las habitaciones ya han sido generadas",
                          duration: const Duration(seconds: 3),
                          icon: const Icon(Icons.info),
                          shouldIconPulse: true,
                          backgroundColor: Colors.green);
                    },
                    child: Text(
                      "Habitaciones Generadas",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    controller: descripcion,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText:
                                          controlh.listarHotels![0].descripcion,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Modificar descripción",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      controlc.listaHabitacion(dato).then(
                            (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ListHabitaciones(),
                              ),
                            ),
                          );
                    },
                    child: Text(
                      "Ver habitaciones",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cambiar foto",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Actualizar datos",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cambiar contraseña",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
