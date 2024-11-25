import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_request_body.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_request_body/signup_request_body.dart';

class AuthQueries {
  factory AuthQueries() {
    return _instance;
  }
  const AuthQueries._();

  static const AuthQueries _instance = AuthQueries._();

  static Map<String, dynamic> loginMapQuery(
      {required LoginRequestBody loginBody}) {
    return {
      'query': r'''
          mutation Login($email: String!, $password: String!) {
            login(email: $email, password: $password) {
              access_token
              refresh_token
            }
          }
        ''',
      'variables': {
        'email': loginBody.email,
        'password': loginBody.password,
      },
    };
  }

  static Map<String, dynamic> registerMapQuery(
      {required SignupReqeustBody registerBody}) {
    return {
      'query': r'''
       mutation SignUp($name: String!,$email: String!, $password: String!, $avatar: String!){
          addUser(
            data: {
              name: $name
              email: $email
              password: $password
              avatar: $avatar,
              role: customer
            }
          ) {
              id
              name
              email
              avatar
          }
        }
        ''',
      'variables': {
        'name': registerBody.name,
        'email': registerBody.email,
        'password': registerBody.password,
        'avatar': registerBody.avatar,
      },
    };
  }
}
