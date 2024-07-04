class PokemonMove {
  final String name;

  PokemonMove({
    required this.name,
  });

  PokemonMove copyWith({
    String? name,
  }) =>
      PokemonMove(
        name: name ?? this.name,
      );

  factory PokemonMove.fromMap(Map<String, dynamic> json) => PokemonMove(
        name: json["pokemon_v2_move"]["name"],
      );

  Map<String, dynamic> toMap() => {
        "pokemon_v2_move": {"name": name},
      };
}
