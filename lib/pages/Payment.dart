import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    child: Center(
      child: CreditCardWidget(
          cardNumber: '4111 4582 4582 4511',
          expiryDate: '03/21',
          cardHolderName: 'Mahendra Thammita',
          cvvCode: '154',
          showBackView: false,
          obscureCardNumber: true,
          obscureCardCvv: true,
          height: 175,
          textStyle: TextStyle(color: Colors.yellowAccent),
          animationDuration: Duration(milliseconds: 1000)
      ),

    ),
  ),
))
    .toList();

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final CarouselController _controller = CarouselController();
  String cardNumber = '4111 4582 4582 4511';
  String expiryDate = '';
  String cardHolderName = 'Mahendra Thammita';
  String cvvCode = '';
  bool isCvvFocused = false;
  int _current = 0;

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
                    onTap: () => {Navigator.pushNamed(context, '/location')},
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
                        child: Text('Payment',
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
            Container(
                child:Center(
                  child: Text('Select Your Card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      )
                  ),
                )
            ),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 200,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        ),
                        onPressed: () {},
                        child: Text(
                            'Add a New Card',
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
            SizedBox(height: 5.0),
            Divider(
              color: Colors.grey[300],
              thickness: 2,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                'Items',
                                style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            ),
                            Text(
                                '01',
                                style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            )
                          ]
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                'Delivery',
                                style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                            ),
                            Text(
                                'Rs 500.00',
                                style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            )
                          ]
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 10.0),
            Divider(
              color: Colors.grey[300],
              thickness: 2,
              indent: 30.0,
              endIndent: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                      onPressed: () {},
                      child: Text(
                          'Select Coupons',
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
            Divider(
              color: Colors.grey[300],
              thickness: 2,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            ),
                            Text(
                                'Rs 100.00',
                                style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            )
                          ]
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 26.0, fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                            ),
                            Text(
                                'Rs 400.00',
                                style: TextStyle(
                                  fontSize: 26.0, fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            )
                          ]
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: FlatButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(10.0),
                        hoverColor: Colors.red,
                        onPressed: () => {
                          Navigator.pushNamed(context, '/cart')
                        },
                        child: Text('Pay Now',
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
            SizedBox(height: 60.0),
          ],
        ),
      ),

    );
  }
}
