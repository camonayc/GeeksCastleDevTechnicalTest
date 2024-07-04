import 'package:pokedex_technical_test/src/app/data/model/graph_ql/other_sprite.dart';

class Sprites {
  final Other? other;

  Sprites({
    this.other,
  });

  Sprites copyWith({
    Other? other,
  }) =>
      Sprites(
        other: other ?? this.other,
      );

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
      );

  Map<String, dynamic> toMap() => {
        "other": other?.toMap(),
      };
}