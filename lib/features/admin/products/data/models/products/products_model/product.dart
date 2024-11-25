import 'category.dart';

class Product {
  String? id;
  String? title;
  int? price;
  String? description;
  List<dynamic>? images;
  Category? category;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String?,
        title: json['title'] as String?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'images': images,
        'category': category?.toJson(),
      };
}
