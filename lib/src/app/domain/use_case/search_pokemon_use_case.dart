import 'package:either_dart/either.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/domain/repository/pokemon_repository.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/use_case.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

class SearchPokemonUseCase extends UseCase<List<Pokemon>, String> {
  SearchPokemonUseCase({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(String params) =>
      _pokemonRepository.searchPokemon(name: params);
}
