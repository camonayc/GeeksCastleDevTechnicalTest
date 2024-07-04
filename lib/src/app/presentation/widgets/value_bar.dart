import 'package:flutter/material.dart';

class ValueBar extends StatelessWidget {
  final int value; // Valor entre 1 y 100
  final double height; // Altura de la barra
  final double width; // Ancho de la barra
  final Color backgroundColor; // Color de fondo
  final Color valueColor; // Color de valor

  const ValueBar({
    super.key,
    required this.value,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          width: (width * value) / 100,
          height: height,
          decoration: BoxDecoration(
            color: valueColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
