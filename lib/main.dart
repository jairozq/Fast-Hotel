import 'domain/controller/controllerUser.dart';
import 'package:fasthotel/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlUser());
  runApp(const App());
}