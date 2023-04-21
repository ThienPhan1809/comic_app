import 'package:comic_app/modules/comics/models/comics_model.dart';
import 'package:comic_app/themes/app_colors.dart';
import 'package:comic_app/themes/styles_text.dart';
import 'package:comic_app/utils/string_extension.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});
  final ComicsModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: LightTheme.onBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 72,
                    backgroundImage: NetworkImage(data.poster!),
                  ),
                  Text(
                    data.title.toTitleCase(),
                    style: AppTextStyle.heading2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    color: LightTheme.onBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tác giả: ${data.author}',
                        style: AppTextStyle.headline1),
                    Text('Thể loại: ${data.categoryList}',
                        style: AppTextStyle.headline1),
                    Text('Chương: ${data.header}',
                        style: AppTextStyle.headline1),
                    Text('Trạng thái: ${data.status}',
                        style: AppTextStyle.headline1),
                    Text('Đọc: ${data.viewCount}',
                        style: AppTextStyle.headline1),
                    Text('Đăng: ${data.uploadDate}',
                        style: AppTextStyle.headline1),
                    Text(
                        'Cập nhật: ${DateTime.now().difference(data.updatedDate!).inDays} ngày trước',
                        style: AppTextStyle.headline1),
                  ],
                )),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                decoration: const BoxDecoration(
                    color: LightTheme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  'Đọc truyện',
                  style: AppTextStyle.headline1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
