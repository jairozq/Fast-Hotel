import 'package:fasthotel/ui/content/pageProfile.dart';
import 'package:fasthotel/ui/content/pageReservation.dart';
import 'package:fasthotel/ui/content/pageSearch.dart';
import 'package:fasthotel/ui/content/pageHistory.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListHoteles(),
      const Reservar(),
      const ListHistory(),
      const Profile()
    ];
    return myList[index];
  }
}
