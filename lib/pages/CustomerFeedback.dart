import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerFeedback extends StatefulWidget {
  @override
  _CustomerFeedbackState createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage('assets/images/wave2.png'),
                //         fit: BoxFit.fill
                //     )
                // ),
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
                  child: Text("Feedback", style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),),
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
                                  SizedBox(height: 20),
                                  Container(
                                    child: Text(
                                      'Rate our foods',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Nisebuschgardens',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.insert_comment,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Your feedback',
                                      ),
                                    ),
                                  ),
                                ),
                                  SizedBox(height: 20),
                                  Container(
                                    child: Text(
                                      'Rate our delivery',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Nisebuschgardens',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                 Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.insert_comment,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Your feedback',
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
                    SizedBox(height: 20),
                     FlatButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(20.0),
                      minWidth: 200.0,
                      hoverColor: Colors.red,
                      onPressed: () => {Navigator.pushNamed(context, '/home')},
                      child:
                      Text('Submit', style: TextStyle(color: Colors.white)),
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