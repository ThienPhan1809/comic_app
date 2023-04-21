import 'package:comic_app/modules/comics/pages/homepage/widgets/list_comics.dart';
import 'package:comic_app/modules/comics/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar:
            BottomNavigationBar(fixedColor: Colors.amber, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Thể loại'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories_outlined), label: 'Thư viện'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Tin'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Cá nhân'),
        ]),
        body: const ListComics(),
      ),
    );
  }
}
