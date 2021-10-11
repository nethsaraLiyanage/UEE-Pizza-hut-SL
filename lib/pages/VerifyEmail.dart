import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_auth/email_auth.dart';
import 'package:pizzahut/auth/Auth.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();
  int currentIndex = 1;
  String email = "";
  String otp = "";

    Future validate() async {

bool res = Auth.verifyOtp(otp);
print(res);

    if (res == true) {
 Fluttertoast.showToast(
        msg: "Sucessfully Verified",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
      Navigator.pushNamed(context, '/login');
    } else {
      Fluttertoast.showToast(
        msg: "Verification failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 55,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 120.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
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
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(25),
                                      child: TextFormField(
                                         controller: TextEditingController(),
                                      onChanged: (value) {
                                        otp = value;
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Email is Required';
                                        } 
                                        else{
                                          return null;
                                        }
                                      },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.redAccent,
                                          ),
                                          contentPadding: EdgeInsets.only(top: 15),
                                          hintText: 'OTP',
                                        ),
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
                    SizedBox(height: 10),
                    FlatButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(15.0),
                      minWidth: 200.0,
                      height: 50.0,
                      hoverColor: Colors.red,
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                            validate();
                        }
                       
                      },
                      child:
                      Text('Verify', style: TextStyle(color: Colors.white)),
                      focusColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.red,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                    ),    
                  ],
                ),
              )
            ],
          ),
        ),
        ),
    );
  }
}