import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ControlHotel controlh = Get.put(ControlHotel());

  decodeimage(imagen) {
    var imagen64 = (imagen).split(",")[1];
    var foto = base64Decode(imagen64);
    return foto;
  }

  @override
  Widget build(BuildContext context) {
    if (controlh.listarHotels!.isEmpty) {
      controlh.listHotels().then((value) => Get.toNamed("/homePageH"));
    }
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
            backgroundImage:
                MemoryImage(decodeimage(controlh.listarHotels![0].imagen))),
      ]),
    );
  }
}
