class GetPokemonQuery {
  static String getList(int limit, int offset) {
    return '''
      query samplePokeAPIquery {
        pokemon_v2_pokemon(limit: $limit, offset: $offset) {
          name
          id
          height
          weight
          pokemon_v2_pokemontypes {
            pokemon_v2_type {
              name
            }
          }
          pokemon_v2_pokemonstats {
            base_stat
            pokemon_v2_stat {
              name
            }
          }
          pokemon_v2_pokemonmoves(limit: 8, offset: 0) {
            pokemon_v2_move {
              name
            }
          }
        }
      }
    ''';
  }

  static String searchPokemon(String name) {
    return '''
      query samplePokeAPIquery {
        pokemon_v2_pokemon(where: {name: {_ilike: "%$name%"}}) {
          name
          id
          height
          weight
          pokemon_v2_pokemontypes {
            pokemon_v2_type {
              name
            }
          }
          pokemon_v2_pokemonstats {
            base_stat
            pokemon_v2_stat {
              name
            }
          }
          pokemon_v2_pokemonmoves(limit: 8, offset: 0) {
            pokemon_v2_move {
              name
            }
          }
        }
      }
    ''';
  }
}
