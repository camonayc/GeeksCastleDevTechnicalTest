import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_moves.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/extensions/string.dart';

class TableMoves extends StatelessWidget {
  final List<PokemonMove> items;

  const TableMoves({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    List<String> itemsName = [];
    for (var item in items) {
      itemsName.add(item.name);
    }
    itemsName = itemsName.toSet().toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildRow(itemsName
            .getRange(0, itemsName.length < 3 ? itemsName.length : 3)
            .toList()),
        if (itemsName.length > 3) ...[
          const SizedBox(height: 10),
          buildRow(itemsName
              .getRange(3, itemsName.length < 6 ? itemsName.length : 6)
              .toList()),
        ],
        if (itemsName.length > 6) ...[
          const SizedBox(height: 10),
          buildRow(itemsName
              .getRange(6, itemsName.length < 8 ? itemsName.length : 8)
              .toList()),
        ]
      ],
    );
  }

  Widget buildRow(List<String> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items
          .map((item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: const Border(
                    bottom: BorderSide(color: ColorsToken.white50, width: 1)),
                color: ColorsToken.white20,
              ),
              child: Text(item.capitalizeFirstLetter(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorsToken.white,
                    fontWeight: FontWeight.w400,
                  ))))
          .toList(),
    );
  }
}
