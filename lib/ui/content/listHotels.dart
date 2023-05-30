import 'dart:convert';

import 'package:fasthotel/domain/controller/controllerHotels.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class ListHoteles extends StatelessWidget {
  const ListHoteles({super.key});

  @override
  Widget build(BuildContext context) {

    decodeimage(imagen){
      var imagen64 = (imagen).split(",")[1];
      var foto = base64Decode(imagen64);
      return foto;
    }

    ControlHotels controlh = Get.find();
    return Scaffold(backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('FastHotel',
          style: TextStyle(
            color:Colors.white,
            fontFamily: 'alkbold'
          )
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: OutlinedButton.icon(onPressed: (){Get.toNamed("/login");},
              icon: const Icon(Icons.search_rounded),
              label: const Text('Buscar',
                style: TextStyle(
                  color:Colors.black,
                  fontFamily: 'alkbold'
                )
              ),
              style: const ButtonStyle(backgroundColor:  MaterialStatePropertyAll( Color.fromARGB(255, 0, 174, 187))),
              ),
          )],
      ),
      body: GridView.builder(
        //itemCount: controlh.listaHoteles!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: controlh.listaHoteles!.length,),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            child: Card(
              child: Column(children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Image.memory(decodeimage(controlh.listaHoteles![index].imagen)),
                    //child: Image.asset(controlh.listaHoteles![index].imagen),
                  ),
                  Row(
                    children: [
                      Text(controlh.listaHoteles![index].nombre),
                    ],
                  ),
                  Row(
                    children: [
                      Text(controlh.listaHoteles![index].descripcion),
                    ],
                  ),
                ],),
            ),
          );
        },
      ),
    );
  }
}
