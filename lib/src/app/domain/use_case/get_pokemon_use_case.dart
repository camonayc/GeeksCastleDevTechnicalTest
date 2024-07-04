import 'package:either_dart/either.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/domain/repository/pokemon_repository.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/use_case.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

class GetPokemonUseCase extends UseCase<List<Pokemon>, GetPokemonParams> {
  GetPokemonUseCase({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(GetPokemonParams params) =>
      _pokemonRepository.getPokemonList(
          limit: params.limit, offset: params.offset);
}

class GetPokemonParams {
  final int limit;
  final int offset;

  GetPokemonParams({this.limit = 20, this.offset = 0});
}
