import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentIndex = 3;
  bool checkBox = false;
  int pizVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
          child: Column(children: [
            SingleChildScrollView(
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
                          onTap: () =>
                              {Navigator.pushNamed(context, '/product')},
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
                                          Image.asset(
                                              'assets/images/pizza.png'),
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
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: Checkbox(
                          value: true,
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
                                          Image.asset(
                                              'assets/images/pizza.png'),
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
                                        ),
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
                  SizedBox(height: 40.0),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 5,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Items',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(''),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            'Rs.2500.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(''),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Text('1 Item Selected'),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.red,
                          padding: const EdgeInsets.all(15.0),
                          hoverColor: Colors.red,
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/location')},
                          child: Text('Checkout',
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
                ],
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomLeft: Radius.circular(10),
            //           bottomRight: Radius.circular(10)),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey.withOpacity(0.5),
            //             spreadRadius: 1,
            //             blurRadius: 7,
            //             offset: Offset(-1, 0))
            //       ]),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 1,
            //         child: FlatButton(
            //           onPressed: null,
            //           child: Image.asset('assets/images/home.png'),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 1,
            //         child: FlatButton(
            //           onPressed: null,
            //           child: Image.asset('assets/images/vectoruser.png'),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 1,
            //         child: FlatButton(
            //           onPressed: null,
            //           child: Image.asset('assets/images/vectorsearch.png'),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 1,
            //         child: FlatButton(
            //           onPressed: null,
            //           child: Image.asset('assets/images/vectorcart.png'),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ]),
        ),
        bottomNavigationBar: Container(
          child: Material(
            elevation: 15,
            child: BottomNavigationBar(
              onTap: (currentIndex) => {
                if (currentIndex == 0)
                  {Navigator.pushNamed(context, '/home')}
                else if (currentIndex == 1)
                  {Navigator.pushNamed(context, '/profile')}
                else if (currentIndex == 2)
                  {Navigator.pushNamed(context, '/search')}
                else if (currentIndex == 3)
                  {Navigator.pushNamed(context, '/cart')}
              },
              currentIndex: currentIndex,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black38,
                  ),

                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  // backgroundColor: Colors.redAccent
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    color: Colors.black38,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  // backgroundColor: Colors.redAccent
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black38,
                  ),
                  title: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  // backgroundColor: Colors.redAccent
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "Cart",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  // backgroundColor: Colors.redAccent
                ),
              ],
            ),
          ),
        ));
  }
}
