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
import 'package:pizzahut/pages/Payment.dart';
import 'package:pizzahut/pages/OrderSummery.dart';
import 'package:pizzahut/pages/Tracking.dart';

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
        '/profile': (context) => Profile(),
        '/edit_profile': (context) => EditProfile(),
        '/feedback': (context) => CustomerFeedback(),
        '/cart': (context) => Cart(),
        '/location':(context) => Location(),
        '/payment':(context) => Payment(),
        '/promotions': (context) => Promotions(),
        '/search': (context) => Search(),
        '/summary': (context) => Summary(),
        '/tracking': (context) => Tracking(),
      },
    );
  }
}
