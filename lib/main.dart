import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/app/app.dart';
import 'package:pokedex_technical_test/src/core/config/di/di.dart';
import 'package:pokedex_technical_test/src/core/config/env/environments.dart';
import 'package:pokedex_technical_test/src/core/utils/enum/env_type.dart';

Future<void> main() async {
  await Environment().initConfig(env: EnvType.dev);
  await initHiveForFlutter();
  await DependencyInjection.init();
  runApp(App());
}
