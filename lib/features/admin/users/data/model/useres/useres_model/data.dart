import 'user.dart';

class Data {
	List<User>? users;

	Data({this.users});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				users: (json['users'] as List<dynamic>?)
						?.map((e) => User.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'users': users?.map((e) => e.toJson()).toList(),
			};
}
