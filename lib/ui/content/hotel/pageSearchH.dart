import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:fasthotel/ui/content/hotel/pageReservationH.dart';
import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHoteles extends StatefulWidget {
  const ListHoteles({super.key});

  @override
  State<ListHoteles> createState() => _ListHotelesState();
}

//Cambiar para buscar reservas

String? actualpage;

class _ListHotelesState extends State<ListHoteles> {
  int? texto;

  cargarVista() {
    setState(() {
      idexh = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    ControlHotel controlh = Get.put(ControlHotel());
    ControlTicket controlt = Get.put(ControlTicket());

    if (idexh != 0) {
      cargarVista();
      texto = 0;
    }

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: MediaQuery.of(context).size.height * 0.1,
      strokeWidth: 5,
      color: Colors.cyan,
      onRefresh: () async {
        cargarVista();
        controlt.listTickets(dato).then((value) => Get.toNamed("/homePageH"));
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 10),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: search,
                maxLines: 1,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                      texto = 1;
                      cargarVista();
                      controlt.filtrarTickets(search.text, dato).then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePageH(),
                              ),
                            ),
                          );
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
            controlt.listarTickets!.isEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            texto == 0
                                ? "No hay reservas"
                                : "No hay reservas que coincidan",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "alkreg",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.076),
                          ),
                        );
                      },
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.83,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Text(
                                            " ID: ${controlt.listarTickets![index].ticketId}",
                                            style: TextStyle(
                                                fontFamily: "alkreg",
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.076),
                                          ),
                                        ),
                                        Text(
                                          "${controlt.listarTickets![index].estado}",
                                          style: TextStyle(
                                              color: controlt
                                                          .listarTickets![index]
                                                          .estado ==
                                                      'Vigente'
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              fontFamily: 'alkmed'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Cedula: ${controlt.listarTickets![index].idUser}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                        fontFamily: 'alkmed'),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Número de cuarto: ${controlt.listarTickets![index].habitacion}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.035,
                                                        fontFamily: 'alkmed'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "${controlt.listarTickets![index].fechaInicio}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                        fontFamily: 'alkmed'),
                                                  ),
                                                  Text(
                                                    "${controlt.listarTickets![index].fechaFinal}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03,
                                                        fontFamily: 'alkmed'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
        floatingActionButton: IconButton(
          onPressed: () {
            controlh.searchHotels(dato).then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Reservar(),
                    ),
                  ),
                );
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
