import 'package:flutter/material.dart';

class ExternalDependency {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
