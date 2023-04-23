import 'package:comic_app/modules/comics/models/content_model.dart';
import 'package:comic_app/modules/comics/pages/content_page/widgets/choose_color_button.dart';
import 'package:comic_app/providers/color_provider.dart';
import 'package:comic_app/providers/text_size_provider.dart';
import 'package:comic_app/themes/styles_text.dart';
import 'package:flutter/material.dart';
import 'package:comic_app/utils/string_extension.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, required this.slug});
  final String slug;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late Future<ContentModel> chapter;
  late double _sizeValue;
  bool _isShowFloatingButton = true;
  @override
  void initState() {
    chapter = fetchContentModel(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sizeValue = Provider.of<FontSizeController>(context, listen: false).value;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isShowFloatingButton = !_isShowFloatingButton;
          });
        },
        child: Scaffold(
          floatingActionButton: Visibility(
            visible: _isShowFloatingButton,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ChooseColorThemeButton(color: ComicColorTheme.white),
                    ChooseColorThemeButton(color: ComicColorTheme.green),
                    ChooseColorThemeButton(color: ComicColorTheme.blue),
                    ChooseColorThemeButton(color: ComicColorTheme.black),
                  ],
                ),
                Slider(
                  value: _sizeValue,
                  min: 4,
                  max: 72,
                  onChanged: (newValue) {
                    setState(() {
                      _sizeValue = newValue;
                    });
                    Provider.of<FontSizeController>(context, listen: false)
                        .changeSize(_sizeValue);
                  },
                )
              ],
            ),
          ),
          body: FutureBuilder(
            future: chapter,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Consumer<ColorController>(
                      builder: (context, color1, child) {
                    return Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: color1.currentColor.backgroundColor),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.header,
                            style: AppTextStyle.heading1.copyWith(
                                color: color1.currentColor.textColor,
                                fontSize: _sizeValue),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            parseHtmlString(snapshot.data!.body[0]),
                            style: AppTextStyle.heading2.copyWith(
                                color: color1.currentColor.textColor,
                                fontSize: _sizeValue),
                          )
                        ],
                      ),
                    );
                  }),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
