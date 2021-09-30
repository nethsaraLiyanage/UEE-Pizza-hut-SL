import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/animations/PageBouceAnimation.dart';
import 'package:pizzahut/api/http_service_product.dart';
import 'package:pizzahut/model/Product.dart';
import 'package:pizzahut/pages/product_page.dart';

import 'Cart.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final HttpServiceProduct _httpServiceProduct = new HttpServiceProduct();
  int currentIndex = 1;
  final screens = [
    MainScreen(),
    Cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _httpServiceProduct.getProduct(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product>? products = snapshot.data;

                return (Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 25.0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () =>
                                {Navigator.pushNamed(context, '/promotions')},
                            child: Container(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                      Image.asset('assets/images/banner01.jpg'),
                                )),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    color: Colors.red,
                                    hoverColor: Colors.red,
                                    onPressed: null,
                                    child: Text('Pizza',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    focusColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    onPressed: null,
                                    child: Text('Appetizers',
                                        style: TextStyle(color: Colors.black)),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    color: Colors.black,
                                    hoverColor: Colors.black,
                                    onPressed: null,
                                    child: Text('Others',
                                        style: TextStyle(color: Colors.black)),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Divider(color: Colors.black38),
                          SizedBox(height: 20.0),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: products!
                                      .map(
                                        (Product product) => Column(
                                          children: [GestureDetector(
                                            onTap: () => {
                                              // Navigator.pushNamed(context, '/product')
                                              Navigator.push(
                                                  context,
                                                  PageBouceAnimation(
                                                      widget: Home(product_passed : product)))
                                            },
                                            child: Row(
                                              children: [
                                                productCard(
                                                    product.itemTitle,
                                                    product.mini_desc,
                                                    product.imageUrl,
                                                    product.price.toDouble()),
                                                
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 15.0),
                                          ]
                                        ),
                                      )
                                      .toList())),
                        ],
                      ),
                    )));
              }

              return Center(child: CircularProgressIndicator());
            }),
        bottomNavigationBar: Container(
          child: Material(
            elevation: 15,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              showSelectedLabels: false,
              onTap: (currentIndex) => {
                if (currentIndex == 0)
                  {Navigator.pushNamed(context, '')}
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
        ));
  }
}

Widget productCard(
    String title, String decstiption, String imagePath, double price) {
  return Expanded(
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
                  maxWidth: 120.0,
                  minHeight: 0.0,
                  maxHeight: 120.0,
                  child: Row(
                    children: [
                      Image.network(imagePath, width: 115,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.0),
                SizedBox(
                  height: 25.0,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        decstiption,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      )),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Colors.redAccent,
                    child: Text(
                      price.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
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
  );
}
