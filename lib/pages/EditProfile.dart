import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
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
                      onTap: () => {Navigator.pushNamed(context, '/profile')},
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
                    height: height * 0.8,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
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
                                  padding: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Email',
                                      ),
                                    ),
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
                                          Icons.home,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Delivey address',
                                      ),
                                    ),
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
                                          Icons.phone_android,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Mobile number',
                                      ),
                                    ),
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
                                          Icons.person,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Full name',
                                      ),
                                    ),
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
                                          Icons.lock,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'Old password',
                                      ),
                                    ),
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
                                          Icons.lock,
                                          color: Colors.redAccent,
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 15),
                                        hintText: 'New password',
                                      ),
                                    ),
                                  ),
                                ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  FlatButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(15.0),
                      minWidth: 200.0,
                      hoverColor: Colors.red,
                      onPressed: () => {Navigator.pushNamed(context, '/feedback')},
                      child:
                      Text('Update', style: TextStyle(color: Colors.white)),
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
                      Navigator.pushNamed(context, '/home')
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
        )
      ],
    ),
    ),
    );
  }
}