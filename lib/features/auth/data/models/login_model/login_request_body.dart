// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestBody {
  String? email;
  String? password;
  LoginRequestBody({
    this.email,
    this.password,
  });

  LoginRequestBody copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestBody(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginRequestBody.fromMap(Map<String, dynamic> map) {
    return LoginRequestBody(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestBody.fromJson(String source) =>
      LoginRequestBody.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequestBody(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginRequestBody other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
