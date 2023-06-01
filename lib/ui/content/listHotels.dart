import 'dart:convert';
import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHoteles extends StatelessWidget {
  const ListHoteles({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    decodeimage(imagen){
      var imagen64 = (imagen).split(",")[1];
      var foto = base64Decode(imagen64);
      return foto;
    }

    ControlHotel controlh = Get.find();
    return Scaffold(backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FastHotel',
          style: TextStyle(
            color:Colors.white,
            fontFamily: 'alkbold'
          )
        ),
        /*actions: [
          Container(
            width: MediaQuery.of(context).size.width*0.157,
            child: OutlinedButton.icon(onPressed: (){
              
              //Get.toNamed("/resultdahotels");
              },
              icon: const Icon(Icons.search_rounded,color: Colors.black),
              label: const Text('',
                style: TextStyle(
                  color:Colors.black,
                  fontFamily: 'alkbold'
                )
              ),
              style: const ButtonStyle(backgroundColor:  MaterialStatePropertyAll( Color.fromARGB(255, 0, 174, 187))),
              ),
          )],*/
      ),
      body: ListView.builder(
        itemCount: controlh.listarHotel!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            child: Column(
              children: [
                Card(
                  child: Column(children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Image.memory(decodeimage(controlh.listarHotel![index].imagen)),
                        
                      ),
                      Row(
                        children: [
                          Text(controlh.listarHotel![index].nombre),
                        ],
                      ),
                      Row(
                        children: [
                          Text(controlh.listarHotel![index].descripcion),
                        ],
                      ),
                    ],),
                ),
              ],
            ),
          );;
        },
      ),
      );
  }
}


/*TextFormField(controller: busqueda,
              decoration: InputDecoration(
                hintText: 'Buscar',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              ); */