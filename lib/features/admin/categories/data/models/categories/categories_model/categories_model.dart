import 'data.dart';

class CategoriesModel {
	Data? data;

	CategoriesModel({this.data});

	factory CategoriesModel.fromJson(Map<String, dynamic> json) {
		return CategoriesModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
