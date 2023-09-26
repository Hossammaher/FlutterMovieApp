import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String Url, @required header}) async {
    http.Response response = await http.get(Uri.parse(Url),headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> getTranslate({required String Url, @required header}) async {
    http.Response response = await http.get(Uri.parse(Url),headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['translations'];
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, @required header}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else {
      throw Exception("there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }

  }

  Future<dynamic> put(
      {required String url, @required dynamic body, @required header}) async {
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
    );
    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else {
      throw Exception("there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }

  }
}
