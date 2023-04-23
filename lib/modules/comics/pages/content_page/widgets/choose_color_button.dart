import 'package:comic_app/providers/color_provider.dart';
import 'package:comic_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseColorThemeButton extends StatelessWidget {
  const ChooseColorThemeButton({
    Key? key,
    required this.color,
  }) : super(key: key);
  final ComicColorTheme color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ColorController>(context, listen: false)
            .changeColorTheme(color);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            color: color.backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: const [
              BoxShadow(
                  color: LightTheme.shadowColor,
                  blurRadius: 12,
                  offset: Offset(4, 4))
            ]),
      ),
    );
  }
}
