// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupReqeustBody {
  final String name;
  final String email;
  final String password;
  final String avatar;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  factory SignupReqeustBody.fromMap(Map<String, dynamic> map) {
    return SignupReqeustBody(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory SignupReqeustBody.fromJson(String source) =>
  //     SignupReqeustBody.fromMap(json.decode(source) as Map<String, dynamic>);

  SignupReqeustBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.avatar});
}
