class AddCategory {
	String? id;
	String? name;
	String? image;

	AddCategory({this.id, this.name, this.image});

	factory AddCategory.fromJson(Map<String, dynamic> json) => AddCategory(
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
