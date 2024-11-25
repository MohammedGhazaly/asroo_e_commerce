import 'data.dart';

class ProductsModel {
	Data? data;

	ProductsModel({this.data});

	factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
