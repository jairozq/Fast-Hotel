import 'package:fasthotel/domain/controller/controllerHabitacion.dart';
import 'package:fasthotel/domain/controller/controllerServicios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHabitaciones extends StatefulWidget {
  const ListHabitaciones({super.key});

  @override
  State<ListHabitaciones> createState() => _ListHabitacionesState();
}

class _ListHabitacionesState extends State<ListHabitaciones> {
  ControlHabitaciones controlc = Get.put(ControlHabitaciones());
  ControlServicios controls = Get.find();
  // ControlServicios controls = Get.put(ControlServicios());

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

            print("lista servicios locales: $tamListServicesL");
            // print("lista servicios: ${controls.listarServiciosL}");

            return Container(
              alignment: AlignmentDirectional.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
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
                    controlc.listarHabitaciones![index].servicios ==
                            "No hay servicios"
                        ? Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all()),
                                width: MediaQuery.of(context).size.width * 0.59,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
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
                            decoration: BoxDecoration(border: Border.all()),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                // Image.asset("${controls.listarServiciosL![index + 1].icon}"),
                                Icon(Icons.add),
                                for (int i = 0; i < tamListServices; i++)
                                  for (int j = 0; j < tamListServicesL; j++)
                                    if (int.parse(servicios[i]) ==
                                        controls.listarServiciosL![j].id)
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Image.asset(
                                          controls.listarServiciosL![i].icon,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: OutlinedButton(
                            onPressed: () {
                              print("object");
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
