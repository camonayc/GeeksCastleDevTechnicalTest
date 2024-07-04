import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_moves.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_stats.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_type.dart';

class Pokemon {
  final bool isFavorite;
  final String name;
  final int id;
  final int height;
  final int weight;
  final List<PokemonType> pokemonTypes;
  final List<PokemonStat> pokemonStats;
  final List<PokemonMove> pokemonMoves;

  Pokemon({
    this.isFavorite = false,
    this.name = '',
    this.id = 0,
    this.height = 0,
    this.weight = 0,
    this.pokemonTypes = const [],
    this.pokemonStats = const [],
    this.pokemonMoves = const [],
  });

  Pokemon copyWith({
    bool? isFavorite,
    String? name,
    int? id,
    int? height,
    int? weight,
    List<PokemonType>? pokemonTypes,
    List<PokemonStat>? pokemonStats,
    List<PokemonMove>? pokemonMoves,
  }) =>
      Pokemon(
        isFavorite: isFavorite ?? this.isFavorite,
        name: name ?? this.name,
        id: id ?? this.id,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        pokemonTypes: pokemonTypes ?? this.pokemonTypes,
        pokemonStats: pokemonStats ?? this.pokemonStats,
        pokemonMoves: pokemonMoves ?? this.pokemonMoves,
      );

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        id: json["id"],
        height: json["height"],
        weight: json["weight"],
        pokemonTypes: List<PokemonType>.from(
            json["pokemon_v2_pokemontypes"].map((x) => PokemonType.fromMap(x))),
        pokemonStats: List<PokemonStat>.from(
            json["pokemon_v2_pokemonstats"].map((x) => PokemonStat.fromMap(x))),
        pokemonMoves: List<PokemonMove>.from(
            json["pokemon_v2_pokemonmoves"].map((x) => PokemonMove.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
        "height": height,
        "weight": weight,
        "pokemon_v2_pokemontypes":
            List<dynamic>.from(pokemonTypes.map((x) => x.toMap())),
        "pokemon_v2_pokemonstats":
            List<dynamic>.from(pokemonStats.map((x) => x.toMap())),
        "pokemon_v2_pokemonmoves":
            List<dynamic>.from(pokemonMoves.map((x) => x.toMap())),
      };
}
