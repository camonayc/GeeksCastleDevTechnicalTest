import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/controller/home_controller.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/custom_app_bar.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/grid_pokemons.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/search_field.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.unfocusSearchField(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppBar(),
        backgroundColor: ColorsToken.black,
        body: Container(
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Text('Search Your Pokemon',
                  style: TextStyle(
                      color: ColorsToken.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 24),
              SearchField(
                focusNode: controller.searchFocusNode,
                onSearch: controller.searchPokemon,
                onChanged: (value) {
                  controller.searchValue.value = value;
                  if (value.isEmpty) {
                    controller.clearSearch();
                  }
                },
              ),
              const SizedBox(height: 22),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsToken.white,
                    ),
                  );
                }
                return GetBuilder(
                  id: 'pokemonGrid',
                  init: controller,
                  builder: (controller) => GridPokemons(
                    pokemonDataList: controller.isSearching.value
                        ? controller.pokemonSearchDataList
                        : controller.pokemonDataList,
                    onTapFavorite: controller.setFavoritePokemon,
                    onTapPokemon: (Pokemon pokemon) async {
                      await controller.onTapDetail(pokemon);
                    },
                  ),
                );
              }),
              Obx(() {
                if (controller.isLoadingMore.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsToken.white,
                    ),
                  );
                }
                if (!controller.isSearching.value) {
                  return TextButton(
                      onPressed: controller.getMorePage,
                      child: const Text('Cargar más',
                          style: TextStyle(
                              color: ColorsToken.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)));
                }
                return const SizedBox();
              })
            ],
          )),
        ),
      ),
    );
  }
}
