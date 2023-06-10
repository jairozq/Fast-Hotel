import 'package:fasthotel/ui/content/client/pageReservation.dart';
import 'package:fasthotel/ui/content/client/pageHistory.dart';
import 'package:fasthotel/ui/content/client/pageProfile.dart';
import 'package:fasthotel/ui/content/client/pageSearch.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListHoteles(),
      const ListHistory(),
      const Profile(),
      const Reservar(),
    ];
    return myList[index];
  }
}
