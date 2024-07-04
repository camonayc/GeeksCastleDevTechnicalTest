import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/get_pokemon_use_case.dart';
import 'package:pokedex_technical_test/src/app/domain/use_case/search_pokemon_use_case.dart';
import 'package:pokedex_technical_test/src/core/config/routes/routes.dart';
import 'package:pokedex_technical_test/src/core/config/service/local_storage.dart';
import 'package:pokedex_technical_test/src/core/config/service/logger_service.dart';
import 'package:pokedex_technical_test/src/core/utils/const/local_storage_keys.dart';

class HomeController extends GetxController {
  HomeController({
    required LocalStorageService localStorageService,
    required GetPokemonUseCase getPokemonGQLUseCase,
    required SearchPokemonUseCase searchPokemonUseCase,
  })  : _localStorageService = localStorageService,
        _getPokemonGQLUseCase = getPokemonGQLUseCase,
        _searchPokemonUseCase = searchPokemonUseCase;

  final LocalStorageService _localStorageService;
  final GetPokemonUseCase _getPokemonGQLUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  final RxList<Pokemon> pokemonDataList = <Pokemon>[].obs;

  final RxList<Pokemon> pokemonSearchDataList = <Pokemon>[].obs;

  final RxList<String> pokemonFavoriteList = <String>[].obs;

  final RxBool isLoading = false.obs;

  final RxBool isLoadingMore = false.obs;

  final RxBool isSearching = false.obs;

  final RxInt page = 0.obs;

  final FocusNode searchFocusNode = FocusNode();

  final RxString searchValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getFavoritePokemonList();
    getFirstPage();
  }

  Future<void> getPokemonByPage(int page) async {
    List<Pokemon> listPokemonData = [];
    final response = await _getPokemonGQLUseCase
        .call(GetPokemonParams(limit: 20, offset: 20 * page));
    response.fold((failure) => LoggerService.error(failure.message ?? ''),
        (result) {
      listPokemonData.addAll(_checkIsFavorite(result));
    });
    pokemonDataList.addAll(listPokemonData);
  }

  Future<void> getFirstPage() async {
    _setLoading();
    await getPokemonByPage(page.value);
    _setLoading();
  }

  Future<void> getMorePage() async {
    _setLoadingMore();
    page.value++;
    await getPokemonByPage(page.value);
    _updateGrid();
    _setLoadingMore();
  }

  List<Pokemon> _checkIsFavorite(List<Pokemon> pokemons) {
    return pokemons.map((e) {
      if (pokemonFavoriteList.contains(e.name)) {
        return e.copyWith(isFavorite: true);
      } else {
        return e;
      }
    }).toList();
  }

  void setFavoritePokemon(String pokemonName) {
    if (pokemonFavoriteList.contains(pokemonName)) {
      pokemonFavoriteList.remove(pokemonName);
      if (isSearching.value) {
        pokemonSearchDataList.value = pokemonSearchDataList.map(
          (e) {
            if (e.name == pokemonName) {
              return e.copyWith(isFavorite: false);
            } else {
              return e;
            }
          },
        ).toList();
      } else {
        pokemonDataList.value = pokemonDataList.map(
          (e) {
            if (e.name == pokemonName) {
              return e.copyWith(isFavorite: false);
            } else {
              return e;
            }
          },
        ).toList();
      }
    } else {
      pokemonFavoriteList.add(pokemonName);
      if (isSearching.value) {
        pokemonSearchDataList.value = pokemonSearchDataList.map(
          (e) {
            if (e.name == pokemonName) {
              return e.copyWith(isFavorite: true);
            } else {
              return e;
            }
          },
        ).toList();
      } else {
        pokemonDataList.value = pokemonDataList.map(
          (e) {
            if (e.name == pokemonName) {
              return e.copyWith(isFavorite: true);
            } else {
              return e;
            }
          },
        ).toList();
      }
    }
    _savePokemonFavorite();
    _updateGrid();
    return;
  }

  Future<void> _savePokemonFavorite() async {
    await _localStorageService.delete(LocalStorageKeys.pokemonFavoriteList);
    _localStorageService.saveList(
        LocalStorageKeys.pokemonFavoriteList, pokemonFavoriteList.toList());
  }

  void getFavoritePokemonList() {
    pokemonFavoriteList.value =
        _localStorageService.read(LocalStorageKeys.pokemonFavoriteList);
  }

  Future<void> searchPokemon() async {
    if (searchValue.isEmpty) {
      isSearching.value = false;
      pokemonSearchDataList.value = <Pokemon>[];
      _updateGrid();
      return;
    } else {
      _setLoading();
      final response = await _searchPokemonUseCase.call(searchValue.value);
      response.fold((failure) => LoggerService.error(failure.message ?? ''),
          (result) {
        pokemonSearchDataList.value = result;
      });
      pokemonSearchDataList.value = _checkIsFavorite(pokemonSearchDataList);
      isSearching.value = true;

      _updateGrid();
      _setLoading();
    }
  }

  void clearSearch() {
    isSearching.value = false;
    pokemonSearchDataList.value = <Pokemon>[];
    pokemonDataList.value = _checkIsFavorite(pokemonDataList);
    _updateGrid();
  }

  void unfocusSearchField() {
    searchFocusNode.unfocus();
  }

  _setLoading() {
    isLoading.value = !isLoading.value;
  }

  _setLoadingMore() {
    isLoadingMore.value = !isLoadingMore.value;
  }

  void _updateGrid() {
    update(['pokemonGrid']);
  }

  Future<void> onTapDetail(Pokemon pokemon) async {
    await Future.delayed(const Duration(milliseconds: 300));
    Get.toNamed(Routes.detail, arguments: pokemon);
  }
}
