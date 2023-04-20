import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Models/user.dart';

class apiServices {
  final String _url = 'http://127.0.0.1:8000/api/';
  Future<List<User>> getuser() async {
    final alluserUrl = Uri.parse('http://127.0.0.1:8000/api/index');
    final response = await http.get(alluserUrl);
    // print(response.body);
    List<User> allUser = [];
    final body = json.decode(response.body) as List;
    for (var musees in body) {
      allUser.add(User.fromJson(musees));
    }
    return allUser;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
