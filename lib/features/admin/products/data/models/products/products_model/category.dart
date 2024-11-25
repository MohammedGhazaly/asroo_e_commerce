class Category {
	String? id;
	String? name;
	String? image;

	Category({this.id, this.name, this.image});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
				id: json['id'] as String?,
				name: json['name'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
			};
}
