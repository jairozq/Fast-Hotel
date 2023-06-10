import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:fasthotel/ui/content/pageHome.dart';
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
    ControlTicket controlt = Get.put(ControlTicket());

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
                    controlt.listTicketsVig(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage(
                              index: 1,
                            ),
                          ));
                    });
                  },
                  child: Text("Vigentes",
                      style: TextStyle(
                          fontFamily: 'alkbold',
                          fontSize:
                              MediaQuery.of(context).size.height * 0.025))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.5,
              child: OutlinedButton(
                  onPressed: () {
                    cargarDatos();
                    controlt.listTicketsVen(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage(
                              index: 1,
                            ),
                          ));
                    });
                  },
                  child: Text("Vencidas",
                      style: TextStyle(
                          fontFamily: 'alkbold',
                          fontSize:
                              MediaQuery.of(context).size.height * 0.025))),
            ),
          ]),
        ),
        controlt.listarTickets!.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "No hay reservaciones en el registro",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "alkreg",
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: controlt.listarTickets!.length,
                  itemBuilder: (BuildContext context, int index) {
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Text(
                                      controlt
                                          .listarTickets![index].nombreHotel,
                                      style:
                                          TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045,
                                              fontFamily: 'alkbold')),
                                ),
                                Row(
                                  children: [
                                    Text(controlt.listarTickets![index].idHotel,
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
                                        "${controlt.listarTickets![index].fechaInicio}",
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
              )
      ]),
    );
  }
}
