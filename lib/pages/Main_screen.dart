import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/banner01.jpg'),
                )
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
                          fontWeight: FontWeight.bold)
                      ),
                      focusColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.red,
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
                      child: Text('Appetizers',
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
                      color: Colors.black,
                      hoverColor: Colors.black,
                      onPressed: null,
                      child:
                          Text('Others', style: TextStyle(color: Colors.black)),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 2),
            Divider(color: Colors.black38),

            Container(
              child: productCard('Olive Mixed', 'Check 123456789', 'assets/images/logo.png', 2500.00),
            )
          ],
        ),
      )
    );
  }
}

Widget productCard( String title, String decstiption, String imagePath, double price) {
  return Padding(
    padding: EdgeInsets.all(1.0),
    child: 
      Container(
        height: 120.0,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 10.0, 10.0),
              child: Column(
                  children: [
                  // Row(
                  //   children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          decstiption,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black38
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 20.0,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            color: Colors.redAccent,
                            child: Text(
                              price.toString(),
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                      
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),

      ),
  );
}
// children: [
//       SizedBox(height: 20,),
//       Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover
//           )
//         ),
//       )
//     ],