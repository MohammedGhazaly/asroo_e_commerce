class Login {
	String? accessToken;
	String? refreshToken;

	Login({this.accessToken, this.refreshToken});

	factory Login.fromJson(Map<String, dynamic> json) => Login(
				accessToken: json['access_token'] as String?,
				refreshToken: json['refresh_token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'access_token': accessToken,
				'refresh_token': refreshToken,
			};
}
