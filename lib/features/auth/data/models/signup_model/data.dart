import 'add_user.dart';

class Data {
	AddUser? addUser;

	Data({this.addUser});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				addUser: json['addUser'] == null
						? null
						: AddUser.fromJson(json['addUser'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'addUser': addUser?.toJson(),
			};
}
