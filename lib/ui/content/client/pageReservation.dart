import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:fasthotel/ui/content/client/pageHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reservar extends StatefulWidget {
  const Reservar({super.key});

  @override
  State<Reservar> createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
  ControlTicket controlt = Get.put(ControlTicket());
  ControlHotel controlh = Get.put(ControlHotel());
  TextEditingController habitacion = TextEditingController();
  TextEditingController idUser = TextEditingController();
  TextEditingController nombreHotel = TextEditingController();
  TextEditingController idHotel = TextEditingController();
  TextEditingController detalle = TextEditingController();
  String? fechaInicio;
  String? fechaFinal;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/homePage");
        return true;
      },
      child: Scaffold(
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      controller: nombreHotel,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: controlh.listarHotels![0].nombre,
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
                      controller: idHotel,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: controlh.listarHotels![0].direccion,
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
                      controller: idUser,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
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
                      controller: detalle,
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
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.135,
                              right: MediaQuery.of(context).size.width * 0.1,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000));
                              if (dateTime != null) {
                                setState(() {
                                  fechaInicio =
                                      (dateTime.toString()).split(" ")[0];
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range_outlined),
                            label: Text(
                              "Fecha Inicial",
                              style: TextStyle(
                                  fontFamily: 'alkbold',
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1,
                              right: MediaQuery.of(context).size.width * 0.1,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000));
                              if (dateTime != null) {
                                setState(() {
                                  fechaFinal =
                                      (dateTime.toString()).split(" ")[0];
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range_outlined),
                            label: Text(
                              "Fecha Final",
                              style: TextStyle(
                                  fontFamily: 'alkbold',
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: habitacion,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Cuarto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: FilledButton(
                        onPressed: () {
                          controlt
                              .crearTicket(
                            dato,
                            controlh.listarHotels![0].nombre,
                            controlh.listarHotels![0].direccion,
                            detalle.text,
                            fechaInicio.toString(),
                            fechaFinal.toString(),
                            habitacion.text,
                          )
                              .then((value) {
                            Get.snackbar(
                                'Clientes', controlt.listaMensajes![0].mensaje,
                                duration: const Duration(seconds: 3),
                                icon: const Icon(Icons.info),
                                shouldIconPulse: true,
                                backgroundColor:
                                    controlt.listaMensajes![0].mensaje ==
                                            'Ticket Registrado'
                                        ? Colors.green
                                        : Colors.red);
                          });
                          controlh
                              .listHotels()
                              .then((value) => Get.toNamed("/homePage"));
                        },
                        child: Text(
                          "     Registrar     ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              fontFamily: 'alkbold'),
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
