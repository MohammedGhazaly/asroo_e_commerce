import 'add_category.dart';

class Data {
	AddCategory? addCategory;

	Data({this.addCategory});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				addCategory: json['addCategory'] == null
						? null
						: AddCategory.fromJson(json['addCategory'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'addCategory': addCategory?.toJson(),
			};
}
