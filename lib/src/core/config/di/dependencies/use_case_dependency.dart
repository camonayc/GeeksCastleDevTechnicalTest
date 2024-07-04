import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/domain/repository/pokemon_repository.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/get_pokemon_use_case.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/search_pokemon_use_case.dart';

class UseCaseDependency {
  static void init() {
    Get.put<GetPokemonUseCase>(
        GetPokemonUseCase(pokemonRepository: Get.find<PokemonRepository>()));
    Get.put<SearchPokemonUseCase>(
        SearchPokemonUseCase(pokemonRepository: Get.find<PokemonRepository>()));
  }
}
