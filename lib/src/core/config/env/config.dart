import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex_technical_test/src/core/config/api/poke_api.dart';
import 'package:pokedex_technical_test/src/core/config/env/base_config.dart';

class Config extends BaseConfig {
  @override
  String get environment => dotenv.env['ENVIRONMENT'] ?? '';

  @override
  PokeApi get imageBaseUrl => PokeApi(
      baseUrl: dotenv.env['BASE_URL_IMAGE'] ?? '',
      formatImage: dotenv.env['FORMAT_IMAGE'] ?? '');

  @override
  String get baseUrlGraphQL => dotenv.env['BASE_URL_GRAPH_QL'] ?? '';
}
