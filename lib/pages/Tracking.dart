import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Tracking extends StatefulWidget {
  Tracking({Key? key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {

  int _currentStep = 0;
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
                    onTap: () => {Navigator.pushNamed(context, '/payment')},
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
                        child: Text('Tracking',
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
            SizedBox(height: 20.0),
            Container(
                child:Center(
                  child: Text('Estimated Delivery Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      )
                  ),
                )
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                      child:Center(
                        child: Text('10:00 - 12:00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)
                        ),
                      )
                  ),
                ),
              ],
            ),
            Container(

              child: Theme(
                data: ThemeData(
                    accentColor: Colors.red,
                    primarySwatch: Colors.red,
                    colorScheme: ColorScheme.light(
                        primary: Colors.red
                    ),
                  iconTheme: IconThemeData(
                    size: 40.0,
                  ),
                ),

                child: Stepper(
                  type: StepperType.vertical,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  steps: <Step>[
                    Step(
                      title: new Text('Order Accepted'),
                      content: LimitedBox(
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Order Dispatched'),
                      content: Column(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Delivering...'),
                      content: Column(),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 2 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Confirmation'),
                      content: Column(),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 2 ?
                      StepState.complete : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    width: 10,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: BorderSide(
                            width: 2,
                            color: Colors.red
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/feedback');},
                      child: Text(
                          'Confirm Order Receive',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: FlatButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(10.0),
                        hoverColor: Colors.red,
                        onPressed: () => {
                          Navigator.pushNamed(context, '/cart')
                        },
                        child: Text('Contact Restaurant',
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
            SizedBox(height: 20.0),
          ],
        ),
      ),


    );
  }
}
