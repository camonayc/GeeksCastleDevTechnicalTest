import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class TapActive extends StatelessWidget {
  const TapActive({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorsToken.white, width: 2)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: ColorsToken.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
