import 'package:fasthotel/domain/controller/controllerTickets.dart';
import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHoteles extends StatefulWidget {
  const ListHoteles({super.key});

  @override
  State<ListHoteles> createState() => _ListHotelesState();
}

//Cambiar para buscar reservas

cargarDatos() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  dato = pref.getString("idG").toString();
}

String? actualpage;

class _ListHotelesState extends State<ListHoteles> {
  String texto = "No hay reseñas";

  @override
  Widget build(BuildContext context) {
    print("entro");
    ControlTicket controlt = Get.put(ControlTicket());
    TextEditingController search = TextEditingController();

    modificarIdex() {
      setState(() {
        idexh = 0;
      });
    }

    //print(controlt.listarHotel!);
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      edgeOffset: 20,
      displacement: 200,
      strokeWidth: 5,
      color: Colors.cyan,
      onRefresh: () async {
        controlt.listTickets().then((value) => Get.toNamed("/homePageH"));
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
                controller: search,
                maxLines: 1,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {
                      texto = "No hay reseñas que coincidan";
                      modificarIdex();
                      controlt.filtrarTickets(search.text).then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePageH())));
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
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      texto,
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "alkreg",
                          fontSize: MediaQuery.of(context).size.width * 0.076),
                    ))
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
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      child: Text(""),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Text(" "),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" ",
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
                                        Text(" ",
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
      ),
    );
  }
}
