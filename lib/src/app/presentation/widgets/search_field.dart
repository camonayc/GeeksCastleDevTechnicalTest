import 'package:flutter/material.dart';
import 'package:pokedex_technical_test/src/core/design/tokens/colors.gen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.focusNode,
    this.onSearch,
    this.onChanged,
  });

  final FocusNode focusNode;
  final void Function()? onSearch;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        focusNode: focusNode,
        onChanged: (value) {
          onChanged?.call(value);
        },
        onSubmitted: (value) {
          onSearch?.call();
        },
        cursorColor: ColorsToken.white60,
        style: const TextStyle(
          color: ColorsToken.white60,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          prefixIcon: InkWell(
            splashColor: Colors.transparent,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              onSearch?.call();
              focusNode.unfocus();
            },
            child: const Icon(
              Icons.search,
              color: ColorsToken.white60,
              size: 24,
            ),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: ColorsToken.white60,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: ColorsToken.white30,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: ColorsToken.white60),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
    );
  }
}
