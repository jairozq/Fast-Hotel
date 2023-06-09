import 'package:shared_preferences/shared_preferences.dart';
import 'package:fasthotel/domain/controller/controllerHotel.dart';
import 'package:fasthotel/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void guardaId(String iduser) async {
    SharedPreferences dato = await SharedPreferences.getInstance();
    setState(() {
      dato.setString("idG", iduser);
      print("${dato.getString("idG")}");
    });
  }

  @override
  Widget build(BuildContext context) {
    ControlUser controlu = Get.find();
    ControlHotel controlh = Get.put(ControlHotel());

    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondologin.png'),
                  fit: BoxFit.cover)),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.04),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        "Bienvenido",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            fontFamily: 'alkbold'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
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
                                controlu
                                    .validarUser(user.text, pass.text)
                                    .then((value) {
                                  if (controlu.listarAccessLogin!.isEmpty) {
                                    Get.snackbar(
                                        'Usuarios', 'Usuario no Encontrado',
                                        duration: const Duration(seconds: 3),
                                        icon: const Icon(Icons.info),
                                        shouldIconPulse: true,
                                        backgroundColor: Colors.red);
                                  } else {
                                    guardaId(controlu
                                        .listarAccessLogin![0].iduser
                                        .toString());
                                    if (controlu
                                            .listarAccessLogin![0].tipocuenta ==
                                        "C") {
                                      controlh.listHotels().then(
                                          (value) => Get.toNamed("/homePage"));
                                    } else {
                                      controlh.listHotels().then(
                                          (value) => Get.toNamed("/homeHotel"));
                                    }
                                  }
                                });
                              },
                              child: Text(
                                "     Entrar     ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    fontFamily: 'alkbold'),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: Text(
                                        'Seleccione el tipo de cuenta que desea crear',
                                        style: TextStyle(
                                            wordSpacing:
                                                BorderSide.strokeAlignCenter,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.038,
                                            fontFamily: 'alkreg'),
                                      ),
                                      actions: <Widget>[
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1),
                                        FilledButton(
                                            onPressed: () {
                                              Get.toNamed("/registerHotel");
                                            },
                                            child: const Text(
                                              'Hotel',
                                              style: TextStyle(
                                                  fontFamily: 'alkbold'),
                                            )),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1),
                                        FilledButton(
                                            onPressed: () {
                                              Get.toNamed("/registerUser");
                                            },
                                            child: const Text(
                                              'Cliente',
                                              style: TextStyle(
                                                  fontFamily: 'alkbold'),
                                            )),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1),
                                      ],
                                    ));
                          },
                          child: Text(
                            'Crear cuenta',
                            style: TextStyle(
                              fontFamily: 'alksemb',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                              color: const Color.fromARGB(255, 0, 174, 187),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.1),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Recordar Contraseña',
                            style: TextStyle(
                              fontFamily: 'alksemb',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              color: const Color.fromARGB(255, 0, 174, 187),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
