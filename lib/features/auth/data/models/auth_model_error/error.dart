import 'extensions.dart';
import 'location.dart';

class Error {
	String? message;
	List<Location>? locations;
	List<String>? path;
	Extensions? extensions;

	Error({this.message, this.locations, this.path, this.extensions});

	factory Error.fromJson(Map<String, dynamic> json) => Error(
				message: json['message'] as String?,
				locations: (json['locations'] as List<dynamic>?)
						?.map((e) => Location.fromJson(e as Map<String, dynamic>))
						.toList(),
				path: json['path'] as List<String>?,
				extensions: json['extensions'] == null
						? null
						: Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'locations': locations?.map((e) => e.toJson()).toList(),
				'path': path,
				'extensions': extensions?.toJson(),
			};
}
