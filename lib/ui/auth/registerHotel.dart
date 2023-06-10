import 'dart:convert';

import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class RegisterHotel extends StatefulWidget {
  const RegisterHotel({super.key});

  @override
  State<RegisterHotel> createState() => _RegisterHotelState();
}

class _RegisterHotelState extends State<RegisterHotel> {
  @override
  Widget build(BuildContext context) {
    ControlHotel controlh = Get.put(ControlHotel());
    TextEditingController nombre = TextEditingController();
    TextEditingController direccion = TextEditingController();
    TextEditingController descripcion = TextEditingController();
    TextEditingController habitaciones = TextEditingController();
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    String? imagen64;

    Future selImage(op) async {
      XFile? selectImage;

      if (op == 1) {
        selectImage = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        selectImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (selectImage == null) {
        imagen64 = null;
      } else {
        final pathImage = File(selectImage.path);
        final formaImage = (pathImage.toString()).split(".").last.split("'")[0];
        final bitImage = pathImage.readAsBytesSync();
        final base64 = base64Encode(bitImage);
        String imageFinal = "data:image/$formaImage;base64,$base64";
        imagen64 = imageFinal;
      }

      Navigator.pop(context);
    }

    return Container(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fondoRH.png'),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.06),
                  child: Text(
                    "Ingrese los datos del hotel",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'alkbold',
                        fontSize: MediaQuery.of(context).size.height * 0.035),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Column(
                          children: [
                            TextField(
                              controller: nombre,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Nombre',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: direccion,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Direccion',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: descripcion,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'descripcion',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: habitaciones,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Numero de Habitaciones',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            OutlinedButton.icon(
                              icon: imagen64 != null
                                  ? const Icon(Icons.task_alt)
                                  : const Icon(
                                      Icons.add_photo_alternate_rounded),
                              label: Text(
                                'Foto',
                                style: TextStyle(
                                    fontFamily: 'alksemb',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: SingleChildScrollView(
                                          child: Column(children: [
                                            InkWell(
                                                onTap: () {
                                                  selImage(1);
                                                },
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    child: const Row(children: [
                                                      Expanded(
                                                          child: Text('Camara',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'alkbold'))),
                                                      Icon(Icons.camera_alt,
                                                          color: Colors.purple)
                                                    ]))),
                                            InkWell(
                                                onTap: () {
                                                  selImage(2);
                                                },
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    child: const Row(children: [
                                                      Expanded(
                                                          child: Text('Galeria',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'alkbold'))),
                                                      Icon(Icons.image,
                                                          color: Colors.purple)
                                                    ])))
                                          ]),
                                        ),
                                      );
                                    });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: user,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            FilledButton(
                                onPressed: () {
                                  controlh
                                      .crearHotel(
                                          nombre.text,
                                          direccion.text,
                                          descripcion.text,
                                          habitaciones.text,
                                          imagen64,
                                          user.text,
                                          pass.text)
                                      .then((value) {
                                    Get.snackbar('Clientes',
                                        controlh.listaMensajes![0].mensaje,
                                        duration: const Duration(seconds: 3),
                                        icon: const Icon(Icons.info),
                                        shouldIconPulse: true,
                                        backgroundColor: controlh
                                                    .listaMensajes![0]
                                                    .mensaje ==
                                                'Usuario Almacenado'
                                            ? Colors.green
                                            : Colors.red);
                                  });
                                  controlh
                                      .listHotels()
                                      .then((value) => Get.toNamed("/login"));
                                },
                                child: Text(
                                  '     Registrar     ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                      fontFamily: 'alkbold'),
                                )),
                          ],
                        )),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          child: const Text(
                            'Inicio',
                            style: TextStyle(
                              fontFamily: 'alksemb',
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 174, 187),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                /*Wrap(alignment: WrapAlignment.center,
                children: [
                  Container(
                  width: MediaQuery.of(context).size.height*0.5,
                  height: MediaQuery.of(context).size.height*0.1,
                  child:TextField(
                    controller: imagen,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Ingrese el enlace de su imagen',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ),
                ],),*/
                /*pathImage!=null? Image.file(pathImage,width: 20,height: 20,):*/
              ]),
            );
          },
        ),
      ),
    ));
  }
}
