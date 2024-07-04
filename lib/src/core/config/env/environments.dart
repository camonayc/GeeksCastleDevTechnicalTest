
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex_technical_test/src/core/config/env/base_config.dart';
import 'package:pokedex_technical_test/src/core/config/env/config.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/assets.gen.dart';
import 'package:pokedex_technical_test/src/core/utils/enum/env_type.dart';

class Environment {
  factory Environment() => _instance;

  Environment._internal();
  static final Environment _instance = Environment._internal();

  static late BaseConfig config;

  Future<void> initConfig({required EnvType env}) async {
    config = await _getConfig(env);
  }

  Future<BaseConfig> _getConfig(EnvType environment) async {
    switch (environment) {
      case EnvType.dev:
        await dotenv.load(fileName: AssetsToken.envs.aEnv);
        return Config();
      default:
      await dotenv.load(fileName: AssetsToken.envs.aEnv);
        return Config();
    }
  }
}
