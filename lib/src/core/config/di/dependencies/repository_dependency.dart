import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_technical_test/src/app/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_technical_test/src/app/domain/repository/pokemon_repository.dart';

class RepositoryDependency {
  static void init() {
    Get.put<PokemonRepository>(PokemonRepositoryImpl(
        pokemonDataSource: Get.find<PokemonDataSource>()));
  }
}
