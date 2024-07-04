import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/controller/home_controller.dart';
import 'package:pokedex_technical_test/src/core/utils/models/stats_infor.dart';

class DetailController extends GetxController {
  DetailController({required HomeController homeController})
      : _homeController = homeController;

  final HomeController _homeController;

  Rx<Pokemon> pokemon = Pokemon().obs;

  RxList<StatsInfo> pokemonStats = <StatsInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    pokemon.value = arg;
  }

  void onTapFavorite() {
    pokemon.value =
        pokemon.value.copyWith(isFavorite: !pokemon.value.isFavorite);
    _homeController.setFavoritePokemon(pokemon.value.name);
    update(['pokemonDetail']);
  }
  
}
