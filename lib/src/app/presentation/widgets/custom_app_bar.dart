// custom_app_bar.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/assets.gen.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({
    super.key,
    this.title,
    this.canBack = false,
    this.hasUser = true,
    this.isFavorite = false,
    this.onTapFavorite,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final bool canBack;
  final bool hasUser;
  final bool isFavorite;
  final void Function()? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: ColorsToken.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: ColorsToken.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: canBack
            ? IconButton(
                onPressed: Get.back,
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsToken.white,
                  size: 36,
                ),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: ColorsToken.white,
                  size: 36,
                ),
              ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: hasUser
              ? CircleAvatar(
                  backgroundImage: Image.asset(
                    AssetsToken.images.noPhoto.path,
                  ).image,
                  backgroundColor: ColorsToken.white,
                )
              : IconButton(
                  onPressed: onTapFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.redAccent : ColorsToken.white,
                    size: 36,
                  ),
                ),
        ),
      ],
    );
  }
}
