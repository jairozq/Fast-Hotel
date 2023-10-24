import 'package:fasthotel/ui/content/hotel/pageResenasH.dart';
import 'package:fasthotel/ui/content/hotel/bottom_navH.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fasthotel/ui/content/hotel/routesH.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class HomePageH extends StatefulWidget {
  const HomePageH({
    super.key,
  });

  @override
  State<HomePageH> createState() => _HomePageHState();
}

String dato = '';
int indexh = idexh;

class _HomePageHState extends State<HomePageH> {
  Bnavigator? myBNB;

  cargarDatos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dato = pref.getString("idG").toString();
  }

  @override
  void initState() {
    cargarDatos();
    myBNB = Bnavigator(
      currentIndex: (i) {
        setState(() {
          indexh = i;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("¿Desea salir de la App?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => exit(0),
                          icon: const Icon(Icons.check_rounded),
                          label: const Text("Sí"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close_rounded),
                          label: const Text("No"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: myBNB,
        body: Routes(index: indexh),
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
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'alkbold'))),
            )
          ],
        ),
      ),
    );
  }
}
