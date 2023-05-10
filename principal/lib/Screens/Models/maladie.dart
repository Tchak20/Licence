import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Maladie {
  int id;
  String nom_maladie;
  String symptomes;
  String description;
  String image;
  int count;

  Maladie(
      {required this.id,
      required this.nom_maladie,
      required this.symptomes,
      required this.description,
      required this.image,
      this.count = 0});

  factory Maladie.fromJson(Map<String, dynamic> json) {
    return Maladie(
        id: json['id'] ?? 1,
        nom_maladie: json['nom_maladie'] ?? '',
        symptomes: json['symptomes'] ?? '',
        description: json['description'] ?? '',
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
        'id': id,
        'nom_maladie': nom_maladie,
        'symptomes': symptomes,
        'description': description,
        'image': image,
      };
  @override
  String toString() {
    return 'Maladie{id: $id,nom_maladie: $nom_maladie, symptomes: $symptomes,description: $description,image:$image}';
  }
}
