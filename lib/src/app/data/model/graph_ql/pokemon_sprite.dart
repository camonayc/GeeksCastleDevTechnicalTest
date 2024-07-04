import 'package:pokedex_technical_test/src/app/data/model/graph_ql/sprites.dart';

class PokemonSprite {
  final int id;
  final Sprites sprites;

  PokemonSprite({
    required this.id,
    required this.sprites,
  });

  PokemonSprite copyWith({
    int? id,
    Sprites? sprites,
  }) =>
      PokemonSprite(
        id: id ?? this.id,
        sprites: sprites ?? this.sprites,
      );

  factory PokemonSprite.fromMap(Map<String, dynamic> json) => PokemonSprite(
        id: json["id"],
        sprites: Sprites.fromMap(json["sprites"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sprites": sprites.toMap(),
      };
}
