class PokemonStat {
  final int baseStat;
  final String statData;

  PokemonStat({
    required this.baseStat,
    required this.statData,
  });

  PokemonStat copyWith({
    int? baseStat,
    String? statData,
  }) =>
      PokemonStat(
        baseStat: baseStat ?? this.baseStat,
        statData: statData ?? this.statData,
      );

  factory PokemonStat.fromMap(Map<String, dynamic> json) => PokemonStat(
        baseStat: json["base_stat"],
        statData: json["pokemon_v2_stat"]["name"],
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "pokemon_v2_stat": {"name": statData},
      };
}
