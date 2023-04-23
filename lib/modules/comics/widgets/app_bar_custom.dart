import 'package:comic_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(color: LightTheme.onBackgroundColor),
      child: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Truyện full'.toUpperCase()),
          ],
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.format_align_justify)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cached),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_circle_outline),
          ),
        ],
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
