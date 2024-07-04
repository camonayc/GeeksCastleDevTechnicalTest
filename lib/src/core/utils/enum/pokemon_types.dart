import 'package:flutter/material.dart';

enum PokemonTypeEnum {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  stellar,
  unknown;

  static PokemonTypeEnum fromString(String type) {
    return PokemonTypeEnum.values.firstWhere(
      (e) => e.name == type.toLowerCase(),
      orElse: () => PokemonTypeEnum.unknown,
    );
  }
}

extension PokemonTypeColor on PokemonTypeEnum {
  Color get color {
    switch (this) {
      case PokemonTypeEnum.normal:
        return Colors.grey[600]!;
      case PokemonTypeEnum.fighting:
        return Colors.red[700]!;
      case PokemonTypeEnum.flying:
        return Colors.blue[300]!;
      case PokemonTypeEnum.poison:
        return Colors.purple[300]!;
      case PokemonTypeEnum.ground:
        return Colors.brown[600]!;
      case PokemonTypeEnum.rock:
        return Colors.grey[700]!;
      case PokemonTypeEnum.bug:
        return Colors.lightGreen[300]!;
      case PokemonTypeEnum.ghost:
        return Colors.deepPurple[600]!;
      case PokemonTypeEnum.steel:
        return Colors.blueGrey[500]!;
      case PokemonTypeEnum.fire:
        return Colors.orange[800]!;
      case PokemonTypeEnum.water:
        return Colors.blue[400]!;
      case PokemonTypeEnum.grass:
        return Colors.green[400]!;
      case PokemonTypeEnum.electric:
        return Colors.yellow[600]!;
      case PokemonTypeEnum.psychic:
        return Colors.pink[300]!;
      case PokemonTypeEnum.ice:
        return Colors.cyan[300]!;
      case PokemonTypeEnum.dragon:
        return Colors.indigo[700]!;
      case PokemonTypeEnum.dark:
        return Colors.brown[900]!;
      case PokemonTypeEnum.fairy:
        return Colors.pink[200]!;
      case PokemonTypeEnum.stellar:
        return Colors.deepOrange[400]!;
      case PokemonTypeEnum.unknown:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
