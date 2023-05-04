import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Maladie {
  String nom_maladie;
  String symptomes;
  String image;
  int count;

  Maladie(
      {required this.nom_maladie,
      required this.symptomes,
      required this.image,
      this.count = 0});

  factory Maladie.fromJson(Map<String, dynamic> json) {
    return Maladie(
        nom_maladie: json['nom_maladie'] ?? '',
        symptomes: json['symptomes'] ?? '',
        image: json['image'] ?? '');
  }
  //convert map list to object list
  static List<Maladie> fromJsonList(List<dynamic> jsonList) {
    List<Maladie> productList = [];

    for (var proItem in jsonList) {
      Map<String, dynamic> objetMap = proItem;
      Maladie product = Maladie.fromJson(objetMap);
      productList.add(product);
    }

    return productList;
  } //end fromJsonList

  Map<String, dynamic> toJson() => {
        'nom_maladie': nom_maladie,
        'symptomes': symptomes,
        'image': image,
      };
  @override
  String toString() {
    return 'Maladie{nom_maladie: $nom_maladie, symptomes: $symptomes,image:$image}';
  }
}
