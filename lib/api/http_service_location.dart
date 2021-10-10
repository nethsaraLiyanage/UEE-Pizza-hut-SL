import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzahut/model/Addons.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:flutter_config/flutter_config.dart';
import 'package:pizzahut/model/LocationAddress.dart';

class HttpServiceLocation {

  //final String getlocationUrl = "http://"+FlutterConfig.get('IP')+":8000/addon";

  void getAddress(LatLng location) async {
    Response res = await get(Uri.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng="+location.latitude.toString()+","+location.longitude.toString()+"&key="+FlutterConfig.get('GOOGLE_MAP_API_KEY')));
    if (res.statusCode == 200) {
      print(res.body);
      // List<dynamic> body = jsonDecode(res.body);
      // print(body);
      // LocationAddress addressObj =  body.map((dynamic item) => LocationAddress.fromJson(item));
      LocationAddress addressObj = locationAddressFromJson(res.body);
      String? FormattedAddress = addressObj.results[0].formattedAddress;
      debugPrint(FormattedAddress);
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get products";
    }
  }
}
