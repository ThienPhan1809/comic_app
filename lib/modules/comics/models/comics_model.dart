import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<ComicsModel>> fetchComicsModel() async {
  final response = await http.get(
    Uri.parse('https://truyen-clone.getdata.one/chapter/last-updated-chapter'),
  );
  if (response.statusCode == 200) {
    List body = jsonDecode(response.body) as List;
    return body.map((e) => ComicsModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load comics');
  }
}

class ComicsModel {
  ComicsModel({
    required this.id,
    required this.header,
    required this.slug,
    required this.uploadDate,
    required this.updatedDate,
    required this.storyId,
    required this.viewCount,
    required this.body,
    required this.title,
    required this.author,
    required this.description,
    required this.poster,
    required this.categoryList,
    required this.status,
  });
  int id;
  String? header;
  String? slug;
  DateTime? uploadDate;
  DateTime? updatedDate;
  int? storyId;
  int? viewCount;
  List<dynamic>? body;
  String title;
  String? author;
  List<dynamic>? description;
  String? poster;
  List<dynamic>? categoryList;
  String? status;
  factory ComicsModel.fromJson(Map<String, dynamic> json) {
    return ComicsModel(
      id: json['id'],
      header: json['header'],
      slug: json['slug'],
      uploadDate: DateTime.tryParse(json['uploadDate'])!,
      updatedDate: DateTime.tryParse(json['updatedDate'])!,
      storyId: json['storyId'],
      viewCount: json['viewCount'],
      body: json['body'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      poster: json['poster'],
      categoryList: json['categoryList'],
      status: json['status'],
    );
  }
}
