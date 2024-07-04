import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/get_pokemon_use_case.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/search_pokemon_use_case.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/controller/home_controller.dart';
import 'package:pokedex_technical_test/src/core/config/service/local_storage.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        localStorageService: Get.find<LocalStorageService>(),
        getPokemonGQLUseCase: Get.find<GetPokemonUseCase>(),
        searchPokemonUseCase: Get.find<SearchPokemonUseCase>(),
      ),
    );
  }
}
