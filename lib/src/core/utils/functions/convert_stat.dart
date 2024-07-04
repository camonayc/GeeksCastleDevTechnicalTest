class ConvertValues {
  static double hectogramsToKilograms(double hectograms) {
    return hectograms / 10;
  }

  static double decimetersToMeters(double decimeters) {
    return decimeters / 10;
  }

  static String convertStat(String stat) {
    switch (stat.toLowerCase()) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp. atk';
      case 'special-defense':
        return 'Sp. def';
      case 'speed':
        return 'Speed';
      default:
        return stat; // Retornar el nombre original si no hay coincidencia
    }
  }
}
