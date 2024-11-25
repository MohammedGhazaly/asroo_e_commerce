class Location {
	int? line;
	int? column;

	Location({this.line, this.column});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				line: json['line'] as int?,
				column: json['column'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'line': line,
				'column': column,
			};
}
