import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/core/config/routes/routes.dart';

class SplashController extends GetxController {
  SplashController();

  final RxInt totalPokemon = 0.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    goToHome();
  }

  void goToHome() {
    Get.toNamed(Routes.home);
  }
}
