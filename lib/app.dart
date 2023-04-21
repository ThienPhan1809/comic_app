import 'package:comic_app/routes/route_path.dart';
import 'package:comic_app/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePath.home,
      onGenerateRoute: generateRoute,
    );
  }
}
