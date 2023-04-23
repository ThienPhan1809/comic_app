import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<ChapterModel>> fetchChapterModel(String slug) async {
  final response = await http.get(Uri.parse(
      'https://truyen-clone.getdata.one/story/$slug/chapters'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List body = jsonDecode(response.body) as List;
    return body.map((e) => ChapterModel.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load chapter');
  }
}



class ChapterModel {
  ChapterModel({
    required this.id,
    required this.header,
    required this.slug,
    required this.viewCount,
    required this.updatedDate,
  });

  int id;
  String header;
  String slug;
  int viewCount;
  DateTime? updatedDate;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["id"],
        header: json["header"],
        slug: json["slug"],
        viewCount: json["viewCount"],
        updatedDate: DateTime.tryParse(json["updatedDate"]),
      );
}
