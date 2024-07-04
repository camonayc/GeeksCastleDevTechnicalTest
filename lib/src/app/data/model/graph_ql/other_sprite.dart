
import 'package:pokedex_technical_test/src/app/data/model/graph_ql/sprite_data.dart';

class Other {
  final SpriteData spriteData;

  Other({
    required this.spriteData,
  });

  Other copyWith({
    SpriteData? spriteData,
  }) =>
      Other(
        spriteData: spriteData ?? this.spriteData,
      );

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        spriteData: SpriteData.fromMap(json["official-artwork"]),
      );

  Map<String, dynamic> toMap() => {
        "official-artwork": spriteData.toMap(),
      };
}


