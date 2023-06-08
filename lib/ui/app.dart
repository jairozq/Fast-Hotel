import 'package:fasthotel/ui/auth/login.dart';
import 'package:fasthotel/ui/auth/registerHotel.dart';
import 'package:fasthotel/ui/auth/registerUser.dart';
import 'package:fasthotel/ui/content/pageHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/login',
      routes: {
        "/homePage": (context) => const HomePage(),
        "/login": (context) => const Login(),
        "/registerHotel": (context) => const RegisterHotel(),
        "/registerUser": (context) => const RegisterUser(),
      },
    );
  }
}
