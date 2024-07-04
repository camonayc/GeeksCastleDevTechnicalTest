import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/app/presentation/screens/splash/controller/splash_controller.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/assets.gen.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/fonts.gen.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsToken.black,
      body: Stack(
        children: [
          Center(
            child: AssetsToken.images.splash.image(),
          ),
          Container(
            height: Get.height,
            padding: EdgeInsets.only(bottom: Get.height * 0.2),
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              if (controller.isLoading.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Loading system',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsToken.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyToken.montserrat,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    const CircularProgressIndicator(
                      color: ColorsToken.white,
                      strokeWidth: 3,
                    )
                  ],
                );
              } else {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Full load',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsToken.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyToken.montserrat,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
