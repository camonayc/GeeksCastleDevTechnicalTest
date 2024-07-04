class TypeData {
  final String name;

  TypeData({
    required this.name,
  });

  TypeData copyWith({
    String? name,
  }) =>
      TypeData(
        name: name ?? this.name,
      );

  factory TypeData.fromMap(Map<String, dynamic> json) => TypeData(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
