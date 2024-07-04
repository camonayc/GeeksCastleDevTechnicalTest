import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
