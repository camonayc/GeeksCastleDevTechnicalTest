import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_type.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/enum/pokemon_types.dart';
import 'package:pokedex_technical_test/src/core/utils/extensions/string.dart';

class TypeInfoContainers extends StatelessWidget {
  const TypeInfoContainers({
    super.key,
    required this.types,
  });

  final List<PokemonType> types;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(types.length, (index) {
        final PokemonType type = types[index];
        return Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          height: 32,
          width: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: PokemonTypeEnum.fromString(type.typeData.name).color,
          ),
          child: Text(
            type.typeData.name.capitalizeFirstLetter(),
            style: const TextStyle(
              fontSize: 16,
              color: ColorsToken.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }),
    );
  }
}
