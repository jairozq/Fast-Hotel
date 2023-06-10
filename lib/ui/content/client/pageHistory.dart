import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:fasthotel/ui/content/client/pageHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({
    super.key,
  });

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

int idex = 0;

class _ListHistoryState extends State<ListHistory> {
  ControlTicket controlt = Get.put(ControlTicket());
  ControlHotel controlh = Get.put(ControlHotel());

  cargarVista() {
    setState(() {
      idex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    ControlTicket controlt = Get.put(ControlTicket());
    print(controlt.listarTickets!.length);
    //ControlHotel controlh = Get.put(ControlHotel());
    if (idex == 0) {
      cargarVista();
      //controlh.listarHotel(controlt.listarTickets
      controlt.listTicketsVig(dato.toString()).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ));
      });
    }

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
                    controlt.listTicketsVig(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage(),
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
                    controlt.listTicketsVen(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage(),
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: Text(
                                          controlt.listarTickets![index]
                                              .nombreHotel,
                                          style: TextStyle(
                                              color: controlt
                                                          .listarTickets![index]
                                                          .estado ==
                                                      'Vigente'
                                                  ? Colors.black
                                                  : Colors.red,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045,
                                              fontFamily: 'alkbold')),
                                    ),
                                    controlt.listarTickets![index].estado ==
                                            'Vencida'
                                        ? Container(
                                            child: Text(
                                              "Expirado",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "alkreg",
                                              ),
                                            ),
                                          )
                                        : Container(
                                            child: TextButton(
                                                onPressed: () {
                                                  controlt
                                                      .cancelarTickets(controlt
                                                          .listarTickets![index]
                                                          .ticketId
                                                          .toString())
                                                      .then((value) {
                                                    Get.snackbar(
                                                        "Ticket",
                                                        controlt
                                                            .listaMensajes![0]
                                                            .mensaje,
                                                        duration:
                                                            const Duration(
                                                                seconds: 3),
                                                        icon: const Icon(
                                                            Icons.info),
                                                        shouldIconPulse: true,
                                                        backgroundColor: controlt
                                                                    .listaMensajes![
                                                                        0]
                                                                    .mensaje ==
                                                                'Ticket Cancelado'
                                                            ? Colors.green
                                                            : Colors.red);
                                                  });
                                                  controlt
                                                      .listTicketsVig(
                                                          dato.toString())
                                                      .then((value) {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              const HomePage(),
                                                        ));
                                                  });
                                                },
                                                child: Text("Cancelar",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.035,
                                                        fontFamily:
                                                            'alkbold'))),
                                          )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  controlt.listarTickets![index]
                                                      .idHotel,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.035,
                                                      fontFamily: 'alkbold')),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "${controlt.listarTickets![index].fechaInicio}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.035,
                                                      fontFamily: 'alkreg')),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
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
