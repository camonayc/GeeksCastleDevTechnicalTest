import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/pokemon.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/table_moves.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/table_stats.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/tap_active.dart';
import 'package:pokedex_technical_test/src/app/presentation/widgets/tap_inactive.dart';

class InfoTaps extends StatefulWidget {
  const InfoTaps({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<InfoTaps> createState() => _InfoTapsState();
}

class _InfoTapsState extends State<InfoTaps> {
  bool _isMoves = false;

  void _onTapMoves() => setState(() => _isMoves = !_isMoves);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !_isMoves
                ? const TapActive(
                    title: 'Stats',
                  )
                : TapInactive(
                    title: 'Stats',
                    onTap: _onTapMoves,
                  ),
            _isMoves
                ? const TapActive(
                    title: 'Moves',
                  )
                : TapInactive(
                    title: 'Moves',
                    onTap: _onTapMoves,
                  )
          ],
        ),
      ),
      const SizedBox(height: 24),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.grey[900]!,
              Colors.blueGrey[800]!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp,
            stops: const [0, 1],
          ),
        ),
        child: !_isMoves
            ? TableStats(
                pokemonStats: widget.pokemon.pokemonStats,
              )
            : TableMoves(
                items: widget.pokemon.pokemonMoves,
              ),
      )
    ]);
  }
}
