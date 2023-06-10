import 'package:fasthotel/ui/content/client/pageHome.dart';
import 'package:fasthotel/ui/content/hotel/pageHomeH.dart';
import 'package:fasthotel/ui/auth/registerHotel.dart';
import 'package:fasthotel/ui/auth/registerUser.dart';
import 'package:fasthotel/ui/auth/login.dart';
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
        "/homePageH": (context) => const HomePageH(),
        "/login": (context) => const Login(),
        "/registerHotel": (context) => const RegisterHotel(),
        "/registerUser": (context) => const RegisterUser(),
      },
    );
  }
}
