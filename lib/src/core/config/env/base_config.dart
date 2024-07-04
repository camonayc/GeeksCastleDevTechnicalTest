import 'package:pokedex_technical_test/src/core/config/api/poke_api.dart';

abstract class BaseConfig {
  String get environment;
  String get baseUrlGraphQL;
  PokeApi get imageBaseUrl;
}
