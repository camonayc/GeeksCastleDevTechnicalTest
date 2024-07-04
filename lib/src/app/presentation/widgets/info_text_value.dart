import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class InfoTextValue extends StatelessWidget {
  const InfoTextValue({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value M',
          style: const TextStyle(
              fontSize: 20,
              color: ColorsToken.white,
              fontWeight: FontWeight.w700,
              height: 1.5),
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              color: ColorsToken.white,
              fontWeight: FontWeight.w400,
              height: 1),
        ),
      ],
    );
  }
}
