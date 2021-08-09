import 'package:flutter/material.dart';
import 'package:pizzahut/pages/Login.dart';
import 'package:pizzahut/pages/product_page.dart';
import 'package:pizzahut/pages/splash_page.dart';
import 'package:pizzahut/pages/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/product': (context) => Home(),
        '/welcome': (context) => Welcome(),
      },
    );
  }
}
