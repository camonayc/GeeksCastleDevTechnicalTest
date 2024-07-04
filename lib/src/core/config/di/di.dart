import 'package:pokedex_technical_test/src/core/config/di/dependencies/data_source_dependency.dart';
import 'package:pokedex_technical_test/src/core/config/di/dependencies/external_dependency.dart';
import 'package:pokedex_technical_test/src/core/config/di/dependencies/repository_dependency.dart';
import 'package:pokedex_technical_test/src/core/config/di/dependencies/service_dependency.dart';
import 'package:pokedex_technical_test/src/core/config/di/dependencies/use_case_dependency.dart';

class DependencyInjection {
  static Future<void> init() async {
    ExternalDependency.init();
    DataSourceDependency.init();
    RepositoryDependency.init();
    UseCaseDependency.init();
    await ServiceDependency.init();
  }
}


