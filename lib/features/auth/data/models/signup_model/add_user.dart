class AddUser {
	String? id;
	String? name;
	String? email;
	String? avatar;

	AddUser({this.id, this.name, this.email, this.avatar});

	factory AddUser.fromJson(Map<String, dynamic> json) => AddUser(
				id: json['id'] as String?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				avatar: json['avatar'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'avatar': avatar,
			};
}
