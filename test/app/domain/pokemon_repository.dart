import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_technical_test/src/app/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/get_pokemon_response.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_technical_test/src/core/config/error/error.dart';
import 'package:pokedex_technical_test/src/core/config/error/failure.dart';
import 'pokemon_repository.mocks.dart';

@GenerateMocks([PokemonDataSource])
void runPokemonRepositoryTests() {
  late MockPokemonDataSource mockPokemonDataSource;
  late PokemonRepositoryImpl repository;

  setUp(() {
    mockPokemonDataSource = MockPokemonDataSource();
    repository =
        PokemonRepositoryImpl(pokemonDataSource: mockPokemonDataSource);
  });

  Future<List<Pokemon>> loadMockGetPokemonListData() async {
    final file = File('test/app/fixtures/get_pokemons_list_mock.json');
    final String response = await file.readAsString();
    final data = jsonDecode(response) as Map<String, dynamic>;
    return GetPokemonResponse.fromMap(data).listPokemon;
  }

  Future<List<Pokemon>> loadMockSearchPokemonData() async {
    final file = File('test/app/fixtures/search_pokemon_mock.json');
    final String response = await file.readAsString();
    final data = jsonDecode(response) as Map<String, dynamic>;
    return GetPokemonResponse.fromMap(data).listPokemon;
  }

  group('PokemonRepositoryImpl', () {
    test('getPokemonList returns list of Pokemon when successful', () async {
      final List<Pokemon> mockPokemonList = await loadMockGetPokemonListData();

      when(mockPokemonDataSource.getPokemonList(limit: 25, offset: 0))
          .thenAnswer((_) async => mockPokemonList);

      final result = await repository.getPokemonList(limit: 25, offset: 0);

      expect(result, isA<Right>());
      result.fold(
        (failure) => fail('Expected Right but got Left'),
        (pokemons) {
          expect(pokemons.length, 25);
          expect(pokemons.first.name, 'bulbasaur');
          expect(pokemons[pokemons.length - 1].name, 'pikachu');
        },
      );
    });

    test('getPokemonList returns Failure when data source throws Failure',
        () async {
      final failure = ErrorFailure.decode(null);

      when(mockPokemonDataSource.getPokemonList(limit: 25, offset: 0))
          .thenThrow(failure);

      final result = await repository.getPokemonList(limit: 25, offset: 0);

      expect(result, isA<Left>());
      result.fold(
        (error) => expect(error, isA<Failure>()),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('searchPokemon returns list of Pokemon when successful', () async {
      final List<Pokemon> mockPokemonList = await loadMockSearchPokemonData();

      when(mockPokemonDataSource.searchPokemon(name: 'Pikachu'))
          .thenAnswer((_) async => mockPokemonList);

      final result = await repository.searchPokemon(name: 'Pikachu');

      expect(result, isA<Right>());
      result.fold(
        (failure) => fail('Expected Right but got Left'),
        (pokemons) {
          expect(pokemons.length, 1);
          expect(pokemons[0].name, 'pikachu');
        },
      );
    });

    test('searchPokemon returns Failure when data source throws Failure',
        () async {
      final failure = ErrorFailure.decode(null);

      when(mockPokemonDataSource.searchPokemon(name: 'pikachu'))
          .thenThrow(failure);

      final result = await repository.searchPokemon(name: 'pikachu');

      expect(result, isA<Left>());
      result.fold(
        (error) => expect(error, isA<Failure>()),
        (_) => fail('Expected Left but got Right'),
      );
    });
  });
}
