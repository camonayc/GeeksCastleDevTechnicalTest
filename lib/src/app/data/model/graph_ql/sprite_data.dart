class SpriteData {
  final String? frontShiny;
  final String? frontDefault;

  SpriteData({
    this.frontShiny,
    this.frontDefault,
  });

  SpriteData copyWith({
    String? frontShiny,
    String? frontDefault,
  }) =>
      SpriteData(
        frontShiny: frontShiny ?? this.frontShiny,
        frontDefault: frontDefault ?? this.frontDefault,
      );

  factory SpriteData.fromMap(Map<String, dynamic> json) => SpriteData(
        frontShiny: json["front_shiny"],
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toMap() => {
        "front_shiny": frontShiny,
        "front_default": frontDefault,
      };
}
