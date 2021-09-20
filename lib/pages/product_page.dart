import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget horList() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20.0),
      //padding: const EdgeInsets.all(10.0),
      //width: 100,
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            child: Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: null,
                child: Column(
                  children: [
                    Image.asset('assets/images/onion.png'),
                    SizedBox(height: 8.0),
                    Text(
                      'Onion',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Rs. 100.00',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Image.asset('assets/images/addB.png'),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            child: Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: null,
                child: Column(
                  children: [
                    Image.asset('assets/images/mozzarella.png'),
                    SizedBox(height: 8.0),
                    Text(
                      'Onion',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Rs. 100.00',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Image.asset('assets/images/addB.png'),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            child: Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: null,
                child: Column(
                  children: [
                    Image.asset('assets/images/tomato.png'),
                    SizedBox(height: 8.0),
                    Text(
                      'Onion',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Rs. 100.00',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Image.asset('assets/images/addB.png'),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
              ),
            ),
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget cardTemplate() {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pizza.png'),
            ),
          ),
          Text(
            'Onion',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Text('data'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Image.asset('assets/images/backButton.png'),
                        onTap: ()=>{
                          Navigator.pushNamed(context, '/home')
                        },
                      ),
                      ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(''),
                    ),
                  ),
                  Expanded(
                      flex: 1, child: Image.asset('assets/images/cart.png'))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: Center(
                  child: Container(
                    child: Image.asset('assets/images/pizza.png'),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                child: Text('Olive Mixed',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 6.0),
              Container(
                child: Text(
                  'Olive MixedLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a',
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text('Select Size',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: null,
                        child: Text('SMALL',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: null,
                        child: Text('MEDIUM',
                            style: TextStyle(color: Colors.black)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        color: Colors.red,
                        hoverColor: Colors.red,
                        onPressed: () => {log('message')},
                        child: Text('LARGE',
                            style: TextStyle(color: Colors.white)),
                        focusColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.red,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Select Crust',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: null,
                        child: Column(
                          children: [
                            Image.asset('assets/images/pan.png'),
                            Text(
                              'Pan',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: null,
                        child: Column(
                          children: [
                            Image.asset('assets/images/stuff.png'),
                            Text(
                              'Stuffed',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: null,
                        child: Column(
                          children: [
                            Image.asset('assets/images/saus.png'),
                            Text(
                              'Saussage',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.0),
              Container(
                child: Text('Add to Pizza',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 6.0),
              Padding(padding: const EdgeInsets.all(3.0), child: horList()),
              SizedBox(height: 6.0),
                            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(15.0),
                        hoverColor: Colors.red,
                        onPressed: () => {
                          Navigator.pushNamed(context, '/cart')
                        },
                        child: Text('Add to Cart',
                            style: TextStyle(color: Colors.white)),
                        focusColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.red,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
