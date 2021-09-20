import 'package:flutter/material.dart';
import 'package:pizzahut/pages/Cart.dart';
import 'package:pizzahut/pages/Login.dart';
import 'package:pizzahut/pages/Register.dart';
import 'package:pizzahut/pages/Product_page.dart';
import 'package:pizzahut/pages/splash_page.dart';
import 'package:pizzahut/pages/welcome.dart';
import 'package:pizzahut/pages/Main_screen.dart';
import 'package:pizzahut/pages/Location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/location',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => MainScreen(),
        '/login': (context) => Login(),
        '/product': (context) => Home(),
        '/welcome': (context) => Welcome(),
        '/register': (context) => Register(),
        '/cart': (context) => Cart(),
        '/location':(context) => Location(),
      },
    );
  }
}
