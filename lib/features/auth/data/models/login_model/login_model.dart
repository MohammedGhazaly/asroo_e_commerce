import 'data.dart';

class LoginModel {
	Data? data;

	LoginModel({this.data});

	factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
