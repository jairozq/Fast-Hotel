import 'package:fasthotel/domain/controller/controllerServicios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectServices extends StatefulWidget {
  const SelectServices({super.key});

  @override
  State<SelectServices> createState() => _SelectServicesState();
}

class _SelectServicesState extends State<SelectServices> {
  ControlServicios controls = Get.put(ControlServicios());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/homePageH");
        return true;
      },
      child: Scaffold(
        body: ListView.builder(
          itemCount: controls.listarServiciosL!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: AlignmentDirectional.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Card(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all()),
                                width: MediaQuery.of(context).size.width * 0.75,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  controls.listarServiciosL![index].nombre,
                                  style: TextStyle(
                                      fontFamily: "alkmed",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(border: Border.all()),
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Image.asset(
                                    controls.listarServiciosL![index].icon),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
