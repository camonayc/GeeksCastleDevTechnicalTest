import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/detail/controller/detail_binding.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/detail/detail_screen.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/controller/home_binding.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/home_screen.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/splash/controller/splash_binding.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:pokedex_technical_test/src/core/config/routes/routes.dart';

abstract class Pages {
  static List<GetPage<void>> pages = [
    // Splash Screen
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    // Home Screen
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    // Detail Screen
    GetPage(
      name: Routes.detail,
      page: () => const DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
