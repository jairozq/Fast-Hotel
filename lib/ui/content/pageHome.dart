import 'package:fasthotel/ui/content/bottom_nav.dart';
import 'package:fasthotel/ui/content/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dato = '';
  int index = 0;
  Bnavigator? myBNB;

  cargarDatos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("estoy ${pref.getString("idG")}");
    dato = pref.getString("idG");
    print("paso a $dato");
  }

  @override
  void initState() {
    cargarDatos();
    myBNB = Bnavigator(
      currentIndex: (i) {
        setState(() {
          index = i;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Routes(index: index, dato: dato!),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('FastHotel',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'alkbold',
                fontSize: MediaQuery.of(context).size.height * 0.035)),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.156,
            child: OutlinedButton.icon(
                onPressed: () {
                  Get.toNamed("/login");
                },
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                label: const Text('',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'alkbold'))),
          )
        ],
      ),
    );
  }
}
