import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red[100]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red[100],
                        radius: 100.0,  
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 250.0),
                      ),
                      Text(
                        "Pizza Hut",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Radicalis',
                            // fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      Text(
                        "SRI LANKA",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )
                    ],),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
