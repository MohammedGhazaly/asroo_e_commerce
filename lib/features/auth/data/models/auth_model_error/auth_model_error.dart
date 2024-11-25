import 'error.dart';

class AuthModelError {
	List<Error>? errors;
	dynamic data;

	AuthModelError({this.errors, this.data});

	factory AuthModelError.fromJson(Map<String, dynamic> json) {
		return AuthModelError(
			errors: (json['errors'] as List<dynamic>?)
						?.map((e) => Error.fromJson(e as Map<String, dynamic>))
						.toList(),
			data: json['data'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'errors': errors?.map((e) => e.toJson()).toList(),
				'data': data,
			};
}
