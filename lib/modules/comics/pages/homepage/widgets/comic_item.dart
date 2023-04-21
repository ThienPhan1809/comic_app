import 'package:comic_app/themes/styles_text.dart';
import 'package:comic_app/utils/string_extension.dart';
import 'package:flutter/material.dart';

class ComicItem extends StatelessWidget {
  const ComicItem({
    super.key,
    required this.title,
    required this.author,
    required this.status,
    required this.updatedDate,
    required this.poster,
    required this.header,
    required this.onTap,
  });
  final String title;
  final String author;
  final String status;
  final DateTime updatedDate;
  final String poster;
  final String header;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                radius: 42,
                backgroundImage: NetworkImage(poster),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toTitleCase(),
                    style: AppTextStyle.heading2,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    author.toTitleCase(),
                    style: AppTextStyle.headline2,
                  ),
                  Text(
                    '$header - $status',
                    style: AppTextStyle.headline2,
                  ),
                  Text(
                    '$updatedDate (${DateTime.now().difference(updatedDate).inDays} ngày trước)',
                    style: AppTextStyle.headline2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
