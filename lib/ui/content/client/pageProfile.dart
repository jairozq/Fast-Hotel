import 'package:fasthotel/domain/controller/controllerUser.dart';
import 'package:fasthotel/ui/content/client/pageHistory.dart';
import 'package:fasthotel/ui/content/client/pageHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ControlUser controlu = Get.put(ControlUser());

  decodeimage(imagen) {
    var imagen64 = (imagen).split(",")[1];
    var foto = base64Decode(imagen64);
    return foto;
  }

  cargarVista() {
    setState(() {
      idex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (idex != 2) {
      cargarVista();
    }

    print("es ${controlu.listaUserLogin!.length}");
    if (controlu.listaUserLogin!.length == 0) {
      print(idex);
      controlu.buscarUser(dato).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.49,
            height: MediaQuery.of(context).size.width * 0.49,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan, width: 7),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: controlu.listaUserLogin![0].imagen.isEmpty
                ? CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo_rounded),
                      onPressed: () {},
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: MemoryImage(
                      decodeimage(controlu.listaUserLogin![0].imagen),
                    ),
                  ),
          ),
          Container(
            child: Text(
              controlu.listaUserLogin![0].nombre,
              style: TextStyle(
                fontFamily: "alksemb",
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          Container(
            child: Text(
              "ID:  ${controlu.listaUserLogin![0].cedula}",
              style: TextStyle(
                fontFamily: "alkreg",
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cambiar foto",
                      style: TextStyle(
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Actualizar datos",
                      style: TextStyle(
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cambiar contraseña",
                      style: TextStyle(
                        fontFamily: "alkreg",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
