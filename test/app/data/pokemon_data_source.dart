import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/app/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';

import 'pokemon_data_source.mocks.dart';

@GenerateMocks([GraphQLClient])
void runPokemonDataSourceTests() {
  late MockGraphQLClient mockGraphQLClient;
  late PokemonDataSourceImpl dataSource;

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    dataSource = PokemonDataSourceImpl(clientGQL: mockGraphQLClient);
  });

  Future<Map<String, dynamic>> loadMockGetPokemonListData() async {
    final file = File('test/app/fixtures/get_pokemons_list_mock.json');
    final String response = await file.readAsString();
    return jsonDecode(response) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> loadMockSearchPokemonData() async {
    final file = File('test/app/fixtures/search_pokemon_mock.json');
    final String response = await file.readAsString();
    return jsonDecode(response) as Map<String, dynamic>;
  }

  group('PokemonDataSourceImpl', () {
    test('getPokemonList returns list of Pokemon when successful', () async {
      // Arrange
      final mockData = await loadMockGetPokemonListData();

      final queryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: mockData,
        source: QueryResultSource.network,
      );

      // Act
      when(mockGraphQLClient.query(any)).thenAnswer((_) async => queryResult);

      final pokemons = await dataSource.getPokemonList(limit: 25, offset: 0);

      // Assert
      expect(pokemons, isA<List<Pokemon>>());
      expect(pokemons.length, 25);
    });

    test('getPokemonList throws Exception when query fails', () async {
      // Arrange
      final queryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        exception: OperationException(
            graphqlErrors: [const GraphQLError(message: 'Error')]),
        source: QueryResultSource.network,
      );

      // Act
      when(mockGraphQLClient.query(any)).thenAnswer((_) async => queryResult);

      // Assert
      expect(
        () async => await dataSource.getPokemonList(limit: 25, offset: 0),
        throwsA(isA<Failure>()),
      );
    });

    test('searchPokemon returns list of Pokemon when successful', () async {
      final mockData = await loadMockSearchPokemonData();

      final queryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: mockData,
        source: QueryResultSource.network,
      );

      when(mockGraphQLClient.query(any)).thenAnswer((_) async => queryResult);

      final pokemons = await dataSource.searchPokemon(name: 'pikachu');

      expect(pokemons, isA<List<Pokemon>>());
      expect(pokemons.length, 1);
      expect(pokemons[0].name, 'pikachu');
    });

    test('searchPokemon throws Exception when query fails', () async {
      final queryResult = QueryResult(
        options: QueryOptions(document: gql('')),
        exception: OperationException(
            graphqlErrors: [const GraphQLError(message: 'Error')]),
        source: QueryResultSource.network,
      );

      when(mockGraphQLClient.query(any)).thenAnswer((_) async => queryResult);

      expect(
        () async => await dataSource.searchPokemon(name: 'pikachu'),
        throwsA(isA<Failure>()),
      );
    });
  });
}
