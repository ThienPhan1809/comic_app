import 'dart:convert';

import 'package:comic_app/modules/comics/models/chapter_model.dart';
import 'package:http/http.dart' as http;

Future<ContentModel> fetchContentModel(String slug) async {
  var a = await fetchChapterModel(slug);
  final response = await http.get(
    Uri.parse('https://truyen-clone.getdata.one/chapter/id/${a.last.id}'),
  );

  if (response.statusCode == 200) {
    return ContentModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load chapter');
  }
}

class ContentModel {
  ContentModel({
    required this.id,
    required this.header,
    required this.slug,
    required this.body,
    required this.viewCount,
    required this.uploadDate,
    required this.updatedDate,
    this.deletedAt,
  });

  int id;
  String header;
  String slug;
  List<String> body;
  int viewCount;
  DateTime uploadDate;
  DateTime updatedDate;
  dynamic deletedAt;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        body: List<String>.from(json["body"].map((x) => x)),
        viewCount: json["viewCount"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        deletedAt: json["deletedAt"],
      );
}
