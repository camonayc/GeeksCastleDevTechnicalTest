import 'package:pokedex_technical_test/src/app/data/model/graph_ql/type_data.dart';

class PokemonType {
  final TypeData typeData;

  PokemonType({
    required this.typeData,
  });

  PokemonType copyWith({
    TypeData? typeData,
  }) =>
      PokemonType(
        typeData: typeData ?? this.typeData,
      );

  factory PokemonType.fromMap(Map<String, dynamic> json) => PokemonType(
        typeData: TypeData.fromMap(json["pokemon_v2_type"]),
      );

  Map<String, dynamic> toMap() => {
        "pokemon_v2_type": typeData.toMap(),
      };
}
