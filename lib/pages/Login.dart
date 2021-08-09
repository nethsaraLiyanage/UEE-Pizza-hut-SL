import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wave2.png'),
                  fit: BoxFit.fill
                )
              ),
                child: Stack(
                  children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 80.0, left: 200.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            )
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 90),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 10.0,
                                              offset: Offset(0, 5)
                                          )
                                        ]
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Email',
                                          hintStyle: TextStyle(color: Colors.grey[400]),
                                          prefixIcon: Icon(Icons.email)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 10.0,
                                              offset: Offset(0, 5)
                                          )
                                        ]
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Password',
                                          hintStyle: TextStyle(color: Colors.grey[400]),
                                          prefixIcon: Icon(Icons.lock)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(90, 15, 90, 15),
                      color: Colors.red,
                      splashColor: Colors.black12,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      onPressed: (){
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}