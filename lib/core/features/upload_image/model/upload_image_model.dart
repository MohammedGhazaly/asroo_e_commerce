class UploadImageModel {
	String? originalname;
	String? filename;
	String? location;

	UploadImageModel({this.originalname, this.filename, this.location});

	factory UploadImageModel.fromJson(Map<String, dynamic> json) {
		return UploadImageModel(
			originalname: json['originalname'] as String?,
			filename: json['filename'] as String?,
			location: json['location'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'originalname': originalname,
				'filename': filename,
				'location': location,
			};
}
