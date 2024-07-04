import 'package:either_dart/either.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList(
      {required int limit, required int offset});
  Future<Either<Failure, List<Pokemon>>> searchPokemon({required String name});
}
