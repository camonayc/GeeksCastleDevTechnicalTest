import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/animated_pokemon_card.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class GridPokemons extends StatelessWidget {
  const GridPokemons({
    super.key,
    required this.pokemonDataList,
    this.onTapFavorite,
    this.onTapPokemon,
  });

  final List<Pokemon> pokemonDataList;
  final void Function(String pokemonName)? onTapFavorite;
  final void Function(Pokemon pokemon)? onTapPokemon;

  @override
  Widget build(BuildContext context) {
    if (pokemonDataList.isEmpty) {
      return const Center(
          child: Text('No se encontraron Pokemons',
              style: TextStyle(
                fontSize: 16,
                color: ColorsToken.white,
                fontWeight: FontWeight.w500,
              )));
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 20.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pokemonDataList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonDataList[index];
        return AnimatedPokemonCard(
          pokemon: pokemon,
          onTapPokemon: onTapPokemon,
          onTapFavorite: onTapFavorite,
        );
      },
    );
  }
}
