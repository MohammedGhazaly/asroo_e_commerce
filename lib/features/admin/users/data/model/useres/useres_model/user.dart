class User {
  String? id;
  String? name;
  String? email;
  String? avatr;

  User({this.id, this.name, this.email, this.avatr});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        avatr: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
