import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/splash/controller/splash_binding.dart';
import 'package:pokedex_technical_test/src/core/config/client/graph_ql.dart';
import 'package:pokedex_technical_test/src/core/config/routes/pages.dart';
import 'package:pokedex_technical_test/src/core/config/routes/routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final GraphQLClient client = GraphQLConfig().clientToQuery();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(client),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        title: 'Geeks Castle Pokedex',
        getPages: Pages.pages,
        initialRoute: Routes.splash,
        initialBinding: SplashBinding(),
      ),
    );
  }
}
