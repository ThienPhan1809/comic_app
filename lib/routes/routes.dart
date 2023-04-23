import 'package:comic_app/modules/comics/models/comics_model.dart';
import 'package:comic_app/modules/comics/models/content_agrument.dart';
import 'package:comic_app/modules/comics/pages/content_page/content_page.dart';
import 'package:comic_app/modules/comics/pages/detail_page/detail_page.dart';
import 'package:comic_app/modules/comics/pages/homepage/homepage.dart';
import 'package:comic_app/modules/comics/pages/not_found_page.dart';
import 'package:comic_app/routes/route_path.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.home:
      {
        return MaterialPageRoute(builder: (context) => const HomePage());
      }
    case RoutePath.detail:
      {
        final agrs = settings.arguments as ComicsModel;
        return MaterialPageRoute(builder: (context) => DetailPage(data: agrs));
      }
    case RoutePath.content:
      {
        final agrs = settings.arguments as ContentAgrument;
        return MaterialPageRoute(
          builder: (context) => ContentPage(slug: agrs.slug),
        );
      }
    //default
    default:
      return MaterialPageRoute(builder: (context) => const NotFoundPage());
  }
}
