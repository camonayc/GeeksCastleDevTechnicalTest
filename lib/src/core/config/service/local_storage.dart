import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {
  LocalStorageService({required this.preferences});
  final SharedPreferences preferences;
  Future<bool> saveList(String key, List<String> value) =>
      preferences.setStringList(key, value);

  List<String> read(String key) => preferences.getStringList(key) ?? [];

  Future<bool> delete(String key) => preferences.remove(key);
}
