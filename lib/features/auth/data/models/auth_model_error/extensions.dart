import 'original_error.dart';

class Extensions {
	String? code;
	OriginalError? originalError;

	Extensions({this.code, this.originalError});

	factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
				code: json['code'] as String?,
				originalError: json['originalError'] == null
						? null
						: OriginalError.fromJson(json['originalError'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'code': code,
				'originalError': originalError?.toJson(),
			};
}
