import 'category.dart';

class Data {
  List<CategoryData>? categories;

  Data({this.categories});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
      };
}
