import 'package:fasthotel/ui/content/pageProfile.dart';
import 'package:fasthotel/ui/content/pageReservation.dart';
import 'package:fasthotel/ui/content/pageSearch.dart';
import 'package:fasthotel/ui/content/pageHistory.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  final String dato;
  const Routes({super.key, required this.index, required this.dato});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      ListHoteles(dato: dato),
      Reservar(dato: dato),
      ListHistory(dato: dato),
      Profile(
        dato: dato,
      )
    ];
    return myList[index];
  }
}
