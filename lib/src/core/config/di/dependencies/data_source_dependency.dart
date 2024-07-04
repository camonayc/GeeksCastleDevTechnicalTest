import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/app/data/data_source/pokemon_data_source.dart';
import 'package:pokedex_technical_test/src/core/config/client/graph_ql.dart';

class DataSourceDependency {
  static void init() {
    // final ApiClient client = ApiClient();
    final GraphQLClient clientGQL = GraphQLConfig().clientToQuery();
    Get.put<PokemonDataSource>(PokemonDataSourceImpl(clientGQL: clientGQL));
  }
}
