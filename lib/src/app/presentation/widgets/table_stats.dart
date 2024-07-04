import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon_stats.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/value_bar.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/functions/convert_stat.dart';

class TableStats extends StatelessWidget {
  const TableStats({
    super.key,
    required this.pokemonStats,
  });

  final List<PokemonStat> pokemonStats;

  @override
  Widget build(BuildContext context) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(4),
        },
        children: List<TableRow>.generate(pokemonStats.length, (int i) {
          final PokemonStat pokemonStat = pokemonStats[i];
          return TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: i == pokemonStats.length - 1 ? 0 : 10, left: 10),
                  child: Text(ConvertValues.convertStat(pokemonStat.statData),
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsToken.white,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: i == pokemonStats.length - 1 ? 0 : 10, right: 10),
                  child: Text('${pokemonStat.baseStat}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsToken.yellow,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: i == pokemonStats.length - 1 ? 0 : 10),
                  child: ValueBar(
                    value: pokemonStat.baseStat,
                    height: 12,
                    width: 200,
                    backgroundColor: ColorsToken.white30,
                    valueColor: ColorsToken.yellow,
                  ),
                ),
              )
            ],
          );
        }));
  }
}
