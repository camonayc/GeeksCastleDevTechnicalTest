import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/core/config/service/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceDependency {
  static Future<void> init() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Get.put<LocalStorageService>(LocalStorageService(
      preferences: preferences,
    ));
  }
}
