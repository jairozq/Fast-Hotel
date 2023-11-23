import 'package:fasthotel/domain/controller/controllerHabitacion.dart';
import 'package:fasthotel/domain/controller/controllerServicios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ListHabitaciones extends StatefulWidget {
  const ListHabitaciones({super.key});

  @override
  State<ListHabitaciones> createState() => _ListHabitacionesState();
}

class _ListHabitacionesState extends State<ListHabitaciones> {
  ControlHabitaciones controlc = Get.put(ControlHabitaciones());
  ControlServicios controls = Get.put(ControlServicios());

  decodeimage(imagen) {
    var imagen64 = (imagen).split(",")[1];
    var foto = base64Decode(imagen64);
    return foto;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/homePageH");
        return true;
      },
      child: Scaffold(
        body: ListView.builder(
          itemCount: controlc.listarHabitaciones!.length,
          itemBuilder: (BuildContext context, int index) {
            List<String> servicios =
                controlc.listarHabitaciones![index].servicios.split('.');

            int tamListServicesL = controls.listarServiciosL!.length;
            int tamListServices = servicios.length;

            return Container(
              alignment: AlignmentDirectional.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Text(
                            "Número de habitación: ${controlc.listarHabitaciones![index].numero}",
                            style: TextStyle(
                                fontFamily: "alkmed",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Text(
                            controlc.listarHabitaciones![index].estado,
                            style: TextStyle(
                                color: controlc.listarHabitaciones![index]
                                            .estado ==
                                        "DISPONIBLE"
                                    ? Colors.green
                                    : Colors.red,
                                fontFamily: "alkbold",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.038),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    Row(
                      children: [
                        Text(
                          "Servicios de la habitación",
                          style: TextStyle(
                            fontFamily: "alkreg",
                          ),
                        ),
                      ],
                    ),
                    controlc.listarHabitaciones![index].servicios ==
                            "No hay servicios"
                        ? Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: AlignmentDirectional.centerStart,
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                child: Text(
                                  controlc.listarHabitaciones![index].servicios,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "alkreg",
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (int i = 0; i < tamListServices; i++)
                                  for (int j = 0; j < tamListServicesL; j++)
                                    if (int.parse(servicios[i]) ==
                                        controls.listarServiciosL![j].id)
                                      InkWell(
                                        onTap: () {
                                          AlertDialog(
                                            title: Text(controls
                                                .listarServiciosL![j].nombre),
                                            content: Text(controls
                                                .listarServiciosL![j]
                                                .descripcion),
                                            actions: [
                                              OutlinedButton(
                                                  child: Text("Cerrar"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  }),
                                            ],
                                          );
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Image.asset(
                                            controls.listarServiciosL![i].icon,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Row(
                      children: [
                        Text(
                          "Presione para agregar o cambiar una foto",
                          style: TextStyle(
                            fontFamily: "alkreg",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: controlc.listarHabitaciones![index].foto ==
                                  "No"
                              ? Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Icon(Icons.add_a_photo_rounded),
                                )
                              : Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Image.memory(
                                    decodeimage(controlc
                                        .listarHabitaciones![index].foto),
                                  ),
                                ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: controlc.listarHabitaciones![index].foto2 ==
                                  "No"
                              ? Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Icon(Icons.add_a_photo_rounded),
                                )
                              : Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Image.memory(
                                    decodeimage(controlc
                                        .listarHabitaciones![index].foto2),
                                  ),
                                ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: controlc.listarHabitaciones![index].foto3 ==
                                  "No"
                              ? Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Icon(Icons.add_a_photo_rounded),
                                )
                              : Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Image.memory(
                                    decodeimage(controlc
                                        .listarHabitaciones![index].foto3),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: OutlinedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      'Seleccione el servicio que desea agrear',
                                      style: TextStyle(
                                          wordSpacing:
                                              BorderSide.strokeAlignCenter,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.038,
                                          fontFamily: 'alkreg'),
                                    ),
                                    actions: <Widget>[
                                      Container(
                                        decoration:
                                            BoxDecoration(border: Border.all()),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.68,
                                        child: Wrap(
                                          spacing: Checkbox.width,
                                          children: [
                                            for (int j = 0;
                                                j < tamListServicesL;
                                                j++)
                                              if (controls.listarServiciosL![j]
                                                      .tiposervicio ==
                                                  "Habitacion")
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  child: Image.asset(
                                                    controls
                                                        .listarServiciosL![j]
                                                        .icon,
                                                  ),
                                                ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.purple)),
                            child: Text(
                              "Modificar servicios",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "alkmed",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
