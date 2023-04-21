import 'package:comic_app/modules/comics/pages/homepage/widgets/list_comics.dart';
import 'package:comic_app/modules/comics/widgets/app_bar_custom.dart';
import 'package:comic_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: LightTheme.selectedItemColor,
            currentIndex: index,
            unselectedItemColor: LightTheme.unSelectedItemColor,
            elevation: 0,
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'Thể loại'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_stories_outlined), label: 'Thư viện'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Tin'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: 'Cá nhân'),
            ]),
        body: const ListComics(),
      ),
    );
  }
}
