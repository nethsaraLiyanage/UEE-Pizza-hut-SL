import 'package:flutter/material.dart';
import 'package:pizzahut/pages/CustomerFeedback.dart';
import 'package:pizzahut/pages/EditProfile.dart';
import 'package:pizzahut/pages/Cart.dart';
import 'package:pizzahut/pages/Login.dart';
import 'package:pizzahut/pages/Promotions.dart';
import 'package:pizzahut/pages/Profile.dart';
import 'package:pizzahut/pages/Register.dart';
import 'package:pizzahut/pages/Search.dart';
import 'package:pizzahut/pages/product_page.dart';
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
      initialRoute: '/login',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => MainScreen(),
        '/login': (context) => Login(),
        '/product': (context) => Home(),
        '/welcome': (context) => Welcome(),
        '/register': (context) => Register(),
        '/profile': (context) => Profile(),
        '/edit_profile': (context) => EditProfile(),
        '/feedback': (context) => CustomerFeedback(),
        '/cart': (context) => Cart(),
        '/location':(context) => Location(),
        '/promotions': (context) => Promotions(),
        '/search': (context) => Search(),
      },
    );
  }
}
