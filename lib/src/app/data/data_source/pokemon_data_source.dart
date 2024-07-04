import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/get_pokemon_response.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/core/config/error/bad_response_exception.dart';
import 'package:pokedex_technical_test/src/core/config/error/error.dart';
import 'package:pokedex_technical_test/src/core/config/error/exception.dart';
import 'package:pokedex_technical_test/src/core/config/query/get_pokemon_list.dart';

abstract class PokemonDataSource {
  Future<List<Pokemon>> getPokemonList(
      {required int limit, required int offset});
  Future<List<Pokemon>> searchPokemon({required String name});
}

class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl({required GraphQLClient clientGQL})
      : _clientGQL = clientGQL;

  final GraphQLClient _clientGQL;

  @override
  Future<List<Pokemon>> getPokemonList(
      {required int limit, required int offset}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(GetPokemonQuery.getList(limit, offset)),
      );

      final QueryResult result = await _clientGQL.query(options);

      if (result.hasException) {
        throw result.exception!;
      }
      if (result.data != null) {
        final GetPokemonResponse data =
            GetPokemonResponse.fromMap(result.data!);
        return data.listPokemon;
      } else {
        throw BadResponseException(message: result.exception?.toString() ?? '');
      }
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<List<Pokemon>> searchPokemon({required String name}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(GetPokemonQuery.searchPokemon(name)),
      );

      final QueryResult result = await _clientGQL.query(options);

      if (result.hasException) {
        throw result.exception!;
      }
      if (result.data != null) {
        final GetPokemonResponse data =
            GetPokemonResponse.fromMap(result.data!);
        return data.listPokemon;
      } else {
        throw BadResponseException(message: result.exception?.toString() ?? '');
      }
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
