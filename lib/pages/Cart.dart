import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checkBox = false;
  int pizVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 40.0, 30.0, 30.0),
        child: SingleChildScrollView(
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
                      onTap: () => {Navigator.pushNamed(context, '/product')},
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Text(''),
                    ),
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: Text('Shopping Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: Checkbox(
                      value: this.checkBox,
                      onChanged: (value) => {
                        setState(() {
                          this.checkBox = !this.checkBox;
                        })
                      },
                      checkColor: Colors.green,
                      activeColor: Colors.white,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 6,
                    child: FlatButton(
                      onPressed: null,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: const Alignment(0.4, 1),
                              child: SizedBox(
                                width: 10,
                                height: 10,
                                child: OverflowBox(
                                  minWidth: 0.0,
                                  maxWidth: 150.0,
                                  minHeight: 0.0,
                                  maxHeight: 150.0,
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/pizza.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  'Olive Mixed',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  'Rs. 1500.00',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(''),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: () => {
                                          this.setState(() {
                                            this.pizVal = this.pizVal - 1;
                                          }),
                                        },
                                        child: Image.asset(
                                            'assets/images/minus.png'),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: null,
                                        child: Text(this.pizVal.toString()),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: () => {
                                          this.setState(() {
                                            this.pizVal = this.pizVal + 1;
                                          }),
                                        },
                                        child: Image.asset(
                                            'assets/images/plus.png'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black.withOpacity(1),
                              width: 0.3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    child: Checkbox(
                      value: false,
                      onChanged: (value) => {
                        setState(() {
                          this.checkBox = !this.checkBox;
                        })
                      },
                      checkColor: Colors.green,
                      activeColor: Colors.white,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 6,
                    child: FlatButton(
                      onPressed: null,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: const Alignment(0.4, 1),
                              child: SizedBox(
                                width: 10,
                                height: 10,
                                child: OverflowBox(
                                  minWidth: 0.0,
                                  maxWidth: 150.0,
                                  minHeight: 0.0,
                                  maxHeight: 150.0,
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/pizza.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  'Olive Mixed',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  'Rs. 1500.00',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(''),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: () => {
                                          this.setState(() {
                                            this.pizVal = this.pizVal - 1;
                                          }),
                                        },
                                        child: Image.asset(
                                            'assets/images/minus.png'),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: null,
                                        child: Text(this.pizVal.toString()),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                        onPressed: () => {
                                          this.setState(() {
                                            this.pizVal = this.pizVal + 1;
                                          }),
                                        },
                                        child: Image.asset(
                                            'assets/images/plus.png'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black.withOpacity(1),
                              width: 0.3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
