import 'data.dart';

class UseresModel {
	Data? data;

	UseresModel({this.data});

	factory UseresModel.fromJson(Map<String, dynamic> json) => UseresModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
