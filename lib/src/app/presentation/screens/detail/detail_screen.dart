import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/detail/controller/detail_controller.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/custom_app_bar.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/info_taps.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/info_text_value.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/type_info_containers.dart';
import 'package:pokedex_technical_test/src/core/config/env/environments.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/enum/pokemon_types.dart';
import 'package:pokedex_technical_test/src/core/utils/extensions/string.dart';
import 'package:pokedex_technical_test/src/core/utils/functions/convert_stat.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorsToken.black,
        appBar: CustomAppBar(
          title: controller.pokemon.value.name.capitalizeFirstLetter(),
          canBack: true,
          hasUser: false,
          isFavorite: controller.pokemon.value.isFavorite,
          onTapFavorite: controller.onTapFavorite,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  height: 316,
                  width: 396,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: controller.pokemon.value.pokemonTypes.length > 1
                          ? controller.pokemon.value.pokemonTypes
                              .map((e) =>
                                  PokemonTypeEnum.fromString(e.typeData.name)
                                      .color)
                              .toList()
                          : [
                              PokemonTypeEnum.fromString(controller.pokemon
                                      .value.pokemonTypes.first.typeData.name)
                                  .color,
                              Colors.grey[900]!,
                            ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp,
                      stops: const [0, 1],
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: Environment.config.imageBaseUrl
                        .getPokemonImage(controller.pokemon.value.id),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsToken.white,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoTextValue(
                        value: ConvertValues.hectogramsToKilograms(
                                controller.pokemon.value.height.toDouble())
                            .toString(),
                        label: 'Height',
                      ),
                      TypeInfoContainers(
                        types: controller.pokemon.value.pokemonTypes,
                      ),
                      InfoTextValue(
                        value: ConvertValues.decimetersToMeters(
                                controller.pokemon.value.weight.toDouble())
                            .toString(),
                        label: 'Weight',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                InfoTaps(
                  pokemon: controller.pokemon.value,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
    });
  }
}
