// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateCategoryModel {
  final String name;
  final String image;
  CreateCategoryModel({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }
}
