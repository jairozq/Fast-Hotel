import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:fasthotel/ui/content/hotel/pageProfileH.dart';
import 'package:fasthotel/ui/content/hotel/pageReservationH.dart';
import 'package:fasthotel/ui/content/hotel/pageSearchH.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListHoteles(),
      const ListRsena(),
      const Profile(),
      const Reservar(),
    ];
    return myList[index];
  }
}
