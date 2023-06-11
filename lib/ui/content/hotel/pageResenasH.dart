import 'package:fasthotel/domain/controller/controllerResena.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ListRsena extends StatefulWidget {
  const ListRsena({
    super.key,
  });

  @override
  State<ListRsena> createState() => _ListRsenaState();
}

int idexh = 0;

class _ListRsenaState extends State<ListRsena> {
  ControlResena controlr = Get.put(ControlResena());

  cargarVista() {
    setState(() {
      idexh = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (idexh == 0) {
      cargarVista();
      controlr.listResenasP(dato.toString()).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePageH(),
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
                    controlr.listResenasP(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomePageH(),
                          ));
                    });
                  },
                  child: Text("Positivas",
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
                    controlr.listResenasN(dato.toString()).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomePageH(),
                          ));
                    });
                  },
                  child: Text("Negativas",
                      style: TextStyle(
                          fontFamily: 'alkbold',
                          fontSize:
                              MediaQuery.of(context).size.height * 0.025))),
            ),
          ]),
        ),
        controlr.listarResenas!.isEmpty
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
                  itemCount: controlr.listarResenas!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Column(
                        children: [
                          Card(
                            child: Column(children: [
                              RatingBar.builder(
                                itemSize: 30,
                                itemCount: 5,
                                initialRating:
                                    controlr.listarResenas![index].estrellas,
                                itemBuilder: (context, _) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                                onRatingUpdate: (raiting) {
                                  print(raiting);
                                },
                              ),
                            ]),
                          )
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
