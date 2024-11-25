class OriginalError {
	String? message;
	int? statusCode;

	OriginalError({this.message, this.statusCode});

	factory OriginalError.fromJson(Map<String, dynamic> json) => OriginalError(
				message: json['message'] as String?,
				statusCode: json['statusCode'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'statusCode': statusCode,
			};
}
