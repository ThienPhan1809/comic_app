import 'package:comic_app/modules/comics/models/comics_model.dart';
import 'package:comic_app/modules/comics/pages/homepage/widgets/comic_item.dart';
import 'package:comic_app/routes/route_path.dart';
import 'package:flutter/material.dart';

class ListComics extends StatefulWidget {
  const ListComics({
    super.key,
  });

  @override
  State<ListComics> createState() => _ListComicsState();
}

class _ListComicsState extends State<ListComics> {
  late Future<List<ComicsModel>> futureComicsModel;
  @override
  void initState() {
    super.initState();
    futureComicsModel = fetchComicsModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureComicsModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data![index];
              return ComicItem(
                title: data.title,
                author: data.author!,
                status: data.status!,
                updatedDate: data.updatedDate!,
                poster: data.poster!,
                header: data.header!,
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.detail,
                      arguments: ComicsModel(
                          id: data.id,
                          header: data.header,
                          slug: data.slug,
                          uploadDate: data.uploadDate,
                          updatedDate: data.updatedDate,
                          storyId: data.storyId,
                          viewCount: data.viewCount,
                          body: data.body,
                          title: data.title,
                          author: data.author,
                          description: data.description,
                          poster: data.poster,
                          categoryList: data.categoryList,
                          status: data.status));
                },
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
