import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pizzahut/utils/connection.dart';
import 'package:http/http.dart' as http;
import 'package:pizzahut/model/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizzahut/auth/Auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentIndex = 1;
  final storage = new FlutterSecureStorage();
  User user = User('', '', '', '', '');
  String old_password = "";
  String new_password = "";

  Future<User> view() async {
    var id = await Auth.getUserId();
    print("User ID:" + id);
    var res = await http.get(Uri.parse(Connection.baseUrl + "/user/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = await jsonDecode(res.body);
    user.full_name = await result['user']['fullName'];
    user.email = await result['user']['email'];
    user.mobile_number = await result['user']['mobileNumber'];
    user.delivery_address = await result['user']['deliveryAddress'];

    return user;
  }

  Future update() async {
    var id = await Auth.getUserId();
    print(user.full_name);
    var res = await http.put(
        Uri.parse(Connection.baseUrl + "/user/update/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'email': user.email,
          'full_name': user.full_name,
          'mobile_number': user.mobile_number,
          'delivery_address': user.delivery_address,
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      Fluttertoast.showToast(
          msg: "Sucessfully Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/profile');
    } else
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
  }

  Future updatePassword() async {
    var id = await Auth.getUserId();
    var res = await http.put(
        Uri.parse(Connection.baseUrl + "/user/update_password/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'old_password': old_password,
          'new_password': new_password
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      Fluttertoast.showToast(
          msg: "Password changed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/profile');
    } else
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: FutureBuilder(
            future: view(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return Container(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 73),
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
                                        onTap: () => {
                                          Navigator.pushNamed(
                                              context, '/profile')
                                        },
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
                                  'Edit Profile',
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
                                  height: height,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      double innerHeight =
                                          constraints.maxHeight;
                                      double innerWidth = constraints.maxWidth;
                                      return Stack(
                                        fit: StackFit.expand,
                                        children: [
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
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            top: 180,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(
                                                                text:
                                                                    user.email),
                                                        onChanged: (value) {
                                                          user.email = value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Email is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons.email,
                                                                  color: Colors
                                                                      .redAccent,
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        top:
                                                                            15),
                                                                hintText:
                                                                    user.email),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(
                                                                text: user
                                                                    .delivery_address),
                                                        onChanged: (value) {
                                                          user.delivery_address =
                                                              value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Name is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons.home,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          hintText: user
                                                              .delivery_address,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(
                                                                text: user
                                                                    .mobile_number),
                                                        onChanged: (value) {
                                                          user.mobile_number =
                                                              value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Name is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons.phone_android,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          hintText: user
                                                              .mobile_number,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(
                                                                text: user
                                                                    .full_name),
                                                        onChanged: (value) {
                                                          user.full_name =
                                                              value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Name is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons.person,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    child: FlatButton(
                                                      color: Colors.red,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      minWidth: 200.0,
                                                      hoverColor: Colors.red,
                                                      onPressed: () {
                                                        update();
                                                      },
                                                      child: Text('Update',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      focusColor: Colors.red,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: Colors.red,
                                                              width: 1,
                                                              style: BorderStyle
                                                                  .solid),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Text(
                                                    'Password reset',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'Nisebuschgardens',
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(),
                                                        onChanged: (value) {
                                                          old_password = value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Name is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons.lock,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          hintText:
                                                              'Old password',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Material(
                                                      elevation: 5.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController(),
                                                        onChanged: (value) {
                                                          new_password = value;
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          if (value!.isEmpty) {
                                                            return 'Name is Required';
                                                          } else if (1 == 1) {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Icon(
                                                            Icons.lock,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                          hintText:
                                                              'New password',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: FlatButton(
                                                      color: Colors.red,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      minWidth: 200.0,
                                                      hoverColor: Colors.red,
                                                      onPressed: () {
                                                        updatePassword();
                                                      },
                                                      child: Text('Reset ',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      focusColor: Colors.red,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: Colors.red,
                                                              width: 1,
                                                              style: BorderStyle
                                                                  .solid),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        bottomNavigationBar: Container(
                          child: Material(
                            elevation: 15,
                            child: BottomNavigationBar(
                              currentIndex: currentIndex,
                              showSelectedLabels: false,
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
                      )
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
