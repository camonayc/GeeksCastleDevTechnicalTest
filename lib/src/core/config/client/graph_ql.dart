import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/core/config/env/environments.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    Environment.config.baseUrlGraphQL,
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    );
  }
}
