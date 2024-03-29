import 'package:fasthotel/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({super.key});

  @override
  Widget build(BuildContext context) {
    ControlUser controlu = Get.find();
    TextEditingController nombre = TextEditingController();
    TextEditingController cedula = TextEditingController();
    TextEditingController celular = TextEditingController();
    TextEditingController user = TextEditingController();
    TextEditingController passw = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/login");
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fondoRC.png'),
                fit: BoxFit.cover),
          ),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 5, bottom: 45),
                  child: Text(
                    "Ingrese sus datos",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'alkbold',
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: Checkbox.width,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: nombre,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Nombre',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: cedula,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Cedula',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: celular,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Celular',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                    alignment: WrapAlignment.center,
                    spacing: Checkbox.width,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: user,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: passw,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                          onPressed: () {
                            controlu
                                .crearUser(nombre.text, cedula.text,
                                    celular.text, user.text, passw.text)
                                .then(
                              (value) {
                                Get.snackbar('Clientes',
                                    controlu.listaMensajes![0].mensaje,
                                    duration: const Duration(seconds: 3),
                                    icon: const Icon(Icons.info),
                                    shouldIconPulse: true,
                                    backgroundColor:
                                        controlu.listaMensajes![0].mensaje ==
                                                'Usuario Almacenado'
                                            ? Colors.green
                                            : Colors.red);
                              },
                            );
                            Get.toNamed("/login");
                          },
                          child: Text(
                            '     Registrar     ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.035,
                                fontFamily: 'alkbold'),
                          ))
                    ]),
                Row(children: [
                  const SizedBox(width: 20),
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
                ]),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
