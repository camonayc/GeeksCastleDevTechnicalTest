import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';

// class GetPokemonResponse {
//   final List<Pokemon> listPokemon;

//   GetPokemonResponse({
//     required this.listPokemon,
//   });

//   GetPokemonResponse copyWith({
//     List<Pokemon>? listPokemon,
//   }) =>
//       GetPokemonResponse(
//         listPokemon: listPokemon ?? this.listPokemon,
//       );

//   factory GetPokemonResponse.fromMap(Map<String, dynamic> json) =>
//       GetPokemonResponse(
//         listPokemon: List<Pokemon>.from(
//             json["pokemon_v2_pokemon"].map((x) => Pokemon.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "pokemon_v2_pokemon":
//             List<dynamic>.from(listPokemon.map((x) => x.toMap())),
//       };
// }
// To parse this JSON data, do
//
//     final getPokemonResponse = getPokemonResponseFromMap(jsonString);
class GetPokemonResponse {
  final List<Pokemon> listPokemon;

  GetPokemonResponse({
    required this.listPokemon,
  });

  GetPokemonResponse copyWith({
    List<Pokemon>? listPokemon,
  }) =>
      GetPokemonResponse(
        listPokemon: listPokemon ?? this.listPokemon,
      );

  factory GetPokemonResponse.fromMap(Map<String, dynamic> json) =>
      GetPokemonResponse(
        listPokemon: List<Pokemon>.from(
            json["pokemon_v2_pokemon"].map((x) => Pokemon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pokemon_v2_pokemon":
            List<dynamic>.from(listPokemon.map((x) => x.toMap())),
      };
}
