import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class TapInactive extends StatelessWidget {
  const TapInactive({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        splashColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: ColorsToken.gray,
            fontWeight: FontWeight.w700,
          ),
        ));
  }
}
