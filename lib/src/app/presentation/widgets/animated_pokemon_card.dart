import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/core/config/env/environments.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/enum/pokemon_types.dart';
import 'package:pokedex_technical_test/src/core/utils/extensions/string.dart';

class AnimatedPokemonCard extends StatefulWidget {
  final Pokemon pokemon;
  final Function(Pokemon)? onTapPokemon;
  final Function(String)? onTapFavorite;

  const AnimatedPokemonCard({
    super.key,
    required this.pokemon,
    this.onTapPokemon,
    this.onTapFavorite,
  });

  @override
  State<AnimatedPokemonCard> createState() => _AnimatedPokemonCardState();
}

class _AnimatedPokemonCardState extends State<AnimatedPokemonCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onTapPokemon?.call(widget.pokemon);
        setState(() => _isPressed = true);
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.symmetric(vertical: 10),
        transform: _isPressed
            ? Matrix4.translationValues(0, 5, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
            gradient: LinearGradient(
              colors: widget.pokemon.pokemonTypes.length > 1
                  ? widget.pokemon.pokemonTypes
                      .map((e) =>
                          PokemonTypeEnum.fromString(e.typeData.name).color)
                      .toList()
                  : [
                      PokemonTypeEnum.fromString(
                              widget.pokemon.pokemonTypes.first.typeData.name)
                          .color,
                      Colors.grey[900]!,
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: const [0, 1],
            )),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: Environment.config.imageBaseUrl
                    .getPokemonImage(widget.pokemon.id),
                width: 110,
                height: 110,
                placeholder: (context, url) => const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      color: ColorsToken.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      widget.onTapFavorite?.call(widget.pokemon.name),
                  icon: Icon(
                    widget.pokemon.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.pokemon.isFavorite
                        ? Colors.redAccent
                        : ColorsToken.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                  alignment: Alignment.center,
                  child: Text(
                    widget.pokemon.name.capitalizeFirstLetter(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorsToken.white,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
