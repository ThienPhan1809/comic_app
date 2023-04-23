import 'package:comic_app/app.dart';
import 'package:comic_app/providers/color_provider.dart';
import 'package:comic_app/providers/text_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ColorController(),
      ),
      ChangeNotifierProvider(
        create: (context) => FontSizeController(),
      )
    ],
    child: const MyApp(),
  ));
}
