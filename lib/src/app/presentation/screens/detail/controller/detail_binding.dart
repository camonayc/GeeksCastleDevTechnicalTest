import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/detail/controller/detail_controller.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/home/controller/home_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(
        homeController: Get.find<HomeController>(),
      ),
    );
  }
}
