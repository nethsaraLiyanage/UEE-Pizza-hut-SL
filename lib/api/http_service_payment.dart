import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class HttpServicePayment {
  final String addCardUrl = "http://"+FlutterConfig.get('IP')+":8000/payment/addCard";

  Future addCard(String cardNumber , String expiryDate ,String cardHolderName ,String cvvCode ,String cardHolder) async {
    var res = await http.post(Uri.parse(addCardUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'cardNumber': cardNumber,
          'expiryDate': expiryDate,
          'cardHolderName': cardHolderName,
          'cvvCode': cvvCode,
          'cardHolder': cardHolder
        }));
    var result = jsonDecode(res.body);
    print(result['status']);
    if (result['status'] == 201) {
      Fluttertoast.showToast(
          msg: "Successfully Added the Card",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //Navigator.pushNamed(context, '/login');
    } else {
      throw Exception('Failed');
    }
  }
}
