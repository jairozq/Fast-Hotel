import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bnavigator extends StatefulWidget {
  final Function currentIndex;
  const Bnavigator({super.key, required this.currentIndex});

  @override
  State<Bnavigator> createState() => _Bnavigator();
}

class _Bnavigator extends State<Bnavigator> {
  ControlHotel controlh = Get.put(ControlHotel());

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        selectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        selectedFontSize: MediaQuery.of(context).size.width * 0.04,
        unselectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        unselectedFontSize: MediaQuery.of(context).size.width * 0.03,
        currentIndex: idexh,
        onTap: (i) {
          setState(() {
            indexh = i;
            widget.currentIndex(indexh);
          });
          /*if (i == 2) {
            controlh.listHotels().then((value) => Get.toNamed("/homePageH"));
          }*/
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: "Reservar",
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: "Reseñas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Perfil",
          ),
        ]);
  }
}
