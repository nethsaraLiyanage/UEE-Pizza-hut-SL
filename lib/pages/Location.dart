import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slidable_button/slidable_button.dart';

class Location extends StatefulWidget {
  Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool checkBox = false;
  int pizVal = 1;
  var result = "As Soon As Possible";

  static final LatLng _kMapCenter =
  LatLng(6.9271, 79.8612);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 15.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/images/backButton.png',
                          width: 1,
                        ),
                        onTap: () => {Navigator.pushNamed(context, '/cart')},
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                          child:Center(
                            child: Text(''
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                          child:Center(
                            child: Text('Order',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0, fontWeight: FontWeight.bold)
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Divider(
                  color: Colors.grey[200],
                  thickness: 5,
                    indent: 50.0,
                  endIndent: 50.0,
                ),
                SizedBox(height: 5.0),
                Container(
                    child:Center(
                      child: Text('Pick Your Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                          )
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 350,
                          child: GoogleMap(
                            initialCameraPosition: _kInitialPosition,
                            gestureRecognizers: Set()..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          child: Text(
                            'Delivery Time',
                              style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          child: Center(
                            child:SlidableButton(
                              height: 40,
                              width: MediaQuery.of(context).size.width  - 100.00,
                              buttonWidth: 160.0,
                              buttonColor: Colors.red,
                              border: Border.all(
                                color: Colors.red,
                                width: 2.00,
                              ),
                              dismissible: false,
                              label: Center(
                                  child: Text(
                                      result,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.0, fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child:Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child:Text('As Soon As Possible',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.0, fontWeight: FontWeight.bold
                                            )
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child:Container(
                                        padding: EdgeInsets.fromLTRB(2, 2, 25, 2),
                                        child:Text(
                                            'Select Time',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.0, fontWeight: FontWeight.bold)
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                              onChanged: (position) {
                                setState(() {
                                  if (position == SlidableButtonPosition.left) {
                                    result = 'As Soon As Possible';
                                  } else {
                                    result = 'Select Time';
                                  }
                                });
                              },
                            ),
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: FlatButton(
                            color: Colors.red,
                            padding: const EdgeInsets.all(15.0),
                            hoverColor: Colors.red,
                            onPressed: () => {
                              Navigator.pushNamed(context, '/payment')
                            },
                            child: Text('Confirm Location',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                            focusColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        )

                      )
                    ],
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),

    );
  }
}