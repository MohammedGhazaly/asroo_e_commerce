import 'data.dart';

class CreateCategoryResponseModel {
	Data? data;

	CreateCategoryResponseModel({this.data});

	factory CreateCategoryResponseModel.fromJson(Map<String, dynamic> json) {
		return CreateCategoryResponseModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
