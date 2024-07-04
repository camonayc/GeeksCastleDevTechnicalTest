class PokeApi {
  PokeApi({required String baseUrl, required String formatImage})
      : _baseUrl = baseUrl,
        _formatImage = formatImage;

  final String _baseUrl;
  final String _formatImage;

  // Get pokemon
  String getPokemonImage(
    int pokemonId,
  ) =>
      '$_baseUrl/$pokemonId.$_formatImage';
}
