import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String nom;
  String prenom;
  String email;
  String password;

  User(
      {required this.nom,
      required this.prenom,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
  //convert map list to object list
  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> productList = [];

    for (var proItem in jsonList) {
      Map<String, dynamic> objetMap = proItem;
      User product = User.fromJson(objetMap);
      productList.add(product);
    }

    return productList;
  } //end fromJsonList

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'password': password,
      };
}
