import 'package:either_dart/either.dart';
import 'package:pokedex_technical_test/src/app/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/domain/repository/pokemon_repository.dart';
import 'package:pokedex_technical_test/src/core/config/error/error.dart';
import 'package:pokedex_technical_test/src/core/config/error/exception.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({required PokemonDataSource pokemonDataSource})
      : _pokemonDataSource = pokemonDataSource;
  final PokemonDataSource _pokemonDataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList(
      {required int limit, required int offset}) async {
    try {
      final List<Pokemon> response =
          await _pokemonDataSource.getPokemonList(limit: limit, offset: offset);
      return Right<Failure, List<Pokemon>>(response);
    } on Failure catch (error) {
      return Left<Failure, List<Pokemon>>(error);
    } on Error catch (error) {
      return Left<Failure, List<Pokemon>>(ErrorFailure.decode(error));
    } on Exception catch (error) {
      return Left<Failure, List<Pokemon>>(ExceptionFailure.decode(error));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> searchPokemon(
      {required String name}) async {
    try {
      final List<Pokemon> response =
          await _pokemonDataSource.searchPokemon(name: name);
      return Right<Failure, List<Pokemon>>(response);
    } on Failure catch (error) {
      return Left<Failure, List<Pokemon>>(error);
    } on Error catch (error) {
      return Left<Failure, List<Pokemon>>(ErrorFailure.decode(error));
    } on Exception catch (error) {
      return Left<Failure, List<Pokemon>>(ExceptionFailure.decode(error));
    }
  }
}
