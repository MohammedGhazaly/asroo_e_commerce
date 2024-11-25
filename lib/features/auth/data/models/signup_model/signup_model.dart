import 'data.dart';

class SignupModel {
	Data? data;

	SignupModel({this.data});

	factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};
}
