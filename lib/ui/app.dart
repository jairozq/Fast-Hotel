import 'package:fasthotel/ui/auth/login.dart';
import 'package:fasthotel/ui/auth/registerHotel.dart';
import 'package:fasthotel/ui/auth/registerUser.dart';
import 'package:fasthotel/ui/content/hotelResults.dart';
import 'package:fasthotel/ui/content/listHotels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Usando HTTP',
      theme: ThemeData(primarySwatch: Colors.purple), //colorScheme: const ColorScheme.highContrastLight(background: Colors.white)
      initialRoute: '/login',
      routes: {
        "/listHotels": (context) => const ListHoteles(),
        "/login": (context) => const Login(),
        "/registerHotel": (context) => const RegisterHotel(),
        "/registerUser": (context) => const RegisterUser(),
        "/resultdahotels": (context) => const hotelResults(),
      },
    );
  }
}
