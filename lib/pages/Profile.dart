import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                  child: Column(
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
                      onTap: () => {Navigator.pushNamed(context, '/home')},
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'My Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontFamily: 'Nisebuschgardens',
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        height: height * 0.43,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double innerHeight = constraints.maxHeight;
                            double innerWidth = constraints.maxWidth;
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: innerHeight * 0.72,
                                    width: innerWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 80,
                                        ),
                                        Text(
                                          'Jone Doe',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 37,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 0.0, 32.0, 0.0),
                                          child: Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(0.5)
                                            },
                                            children: [
                                              TableRow(children: [
                                                Icon(Icons.email,
                                                    size: 25,
                                                    color: Colors.red),
                                                Text('john@gmail.com',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                              TableRow(children: [
                                                Icon(Icons.phone_iphone,
                                                    size: 25,
                                                    color: Colors.red),
                                                Text('076 1234567',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                              TableRow(children: [
                                                Icon(Icons.home,
                                                    size: 25,
                                                    color: Colors.red),
                                                Text('Address line 1',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/person.png',
                                        width: innerWidth * 0.45,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  left: 260,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      child:     FlatButton(
                                        textColor: Colors.red,
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/login');
                                        },
                                        child: Text("Logout"),
                                        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 250,
                                  left: 260,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      child: FloatingActionButton(
                                        onPressed: () => {
                                        Navigator.pushNamed(context, '/edit_profile')
                                        },
                                        backgroundColor: Colors.red,
                                        tooltip: 'Increment',
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'My Order History',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: (Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    30.0, 20.0, 32.0, 0.0),
                                child: Table(
                                  columnWidths: {0: FlexColumnWidth(0.75)},
                                  children: [
                                    TableRow(children: [
                                      Text('Order',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      Text('date',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      Text('Total',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                    TableRow(children: [
                                      Text('1 Pizza'),
                                      Text('22/08/2021'),
                                      Text('Rs 1500.00'),
                                    ]),
                                    TableRow(children: [
                                      Text('1 Pizza'),
                                      Text('22/08/2021'),
                                      Text('Rs 1500.00'),
                                    ]),
                                  ],
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Track my orders',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
        bottomNavigationBar: Container(
          child: Material(
            elevation: 15,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              showSelectedLabels: false,
              onTap: (currentIndex) => {
                if(currentIndex==0){
                  Navigator.pushNamed(context, '')
                }else if(currentIndex==1){
                  Navigator.pushNamed(context, '/profile')
                }else if(currentIndex==2){
                  Navigator.pushNamed(context, '/search')
                }else if(currentIndex==3){
                  Navigator.pushNamed(context, '/cart')
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.redAccent,
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
                    color: Colors.black38,
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
        ),
    );
  }
}
