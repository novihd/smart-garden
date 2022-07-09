import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static const String _url = "http://10.0.2.2:8000";

  static Future getData(String endpoint) async {
    var response = await client.get(Uri.parse("$_url/$endpoint"));
    try {
      if (response.statusCode != 200) {
        log(response.body);
        var message = json.decode(response.body);
        return Future.error(message);
      }
      return json.decode(response.body);
    } catch (e) {
      debugPrint("error getData -> $e");
    }
  }
}
