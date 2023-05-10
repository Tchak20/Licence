import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Fiche {
  final int id;
  final int maladies_id;
  final String traitements;
  final String prevention;
  final String autres;
  Fiche(
      {required this.id,
      required this.maladies_id,
      required this.traitements,
      required this.prevention,
      required this.autres});
  factory Fiche.fromJson(Map<String, dynamic> json) {
    return Fiche(
      id: json['id'] ?? 1,
      maladies_id: json['maladies_id'] ?? 1,
      traitements: json['traitements'] ?? '',
      prevention: json['prevention'] ?? '',
      autres: json['autres'] ?? '',
    );
  }
  
}
