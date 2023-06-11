import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:flutter/material.dart';

class Bnavigator extends StatefulWidget {
  final Function currentIndex;
  const Bnavigator({super.key, required this.currentIndex});

  @override
  State<Bnavigator> createState() => _Bnavigator();
}

class _Bnavigator extends State<Bnavigator> {
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
        onTap: (index) {
          setState(() {
            idexh = index;
            widget.currentIndex(index);
          });
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
            label: "Reservas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Perfil",
          ),
        ]);
  }
}
