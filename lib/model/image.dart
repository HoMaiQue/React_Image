// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  String id;
  String name;
  String imageSrc;
  bool isFavorite = false;

  ImageModel({
    required this.id,
    required this.name,
    required this.imageSrc,
  });
  void onToggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageSrc': imageSrc,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageSrc: map['imageSrc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
