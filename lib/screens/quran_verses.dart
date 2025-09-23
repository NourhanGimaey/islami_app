import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/quran_data.dart';
import 'package:islami/core/widgets/verse_item.dart';

class QuranVerses extends StatefulWidget {
  static const routeName = '/quran_verses';
  const QuranVerses({super.key});

  @override
  State<QuranVerses> createState() => _QuranVersesState();
}

class _QuranVersesState extends State<QuranVerses> {
  List<String> verses = [];

  void loadVerses(int chapterIndex) async {
    String content = await rootBundle.loadString(
      "assets/files/quran/$chapterIndex.txt",
    );
    List<String> lines = content.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }

  @override
  Widget build(BuildContext context) {
    var chapterData = ModalRoute.of(context)!.settings.arguments as QuranData;
    if (verses.isEmpty) {
      loadVerses(chapterData.chapterIndex);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterData.englishQuranName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: AppColors.darkGrey,
        surfaceTintColor: AppColors.darkGrey,
        iconTheme: IconThemeData(color: AppColors.gold),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.leftCornerDecoration,
                width: MediaQuery.of(context).size.width * .2,
              ),
              Text(
                chapterData.arabicQuranName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Image.asset(
                AppImages.rightCornerDecoration,
                width: MediaQuery.of(context).size.width * .2,
              ),
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .66,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return VerseItem(verses[index], index + 1);
                  },
                  separatorBuilder: (context, index) {
                    return Text('')
                    // Divider(
                    //   color: AppColors.gold,
                    //   indent: 50,
                    //   endIndent: 50,
                    // )
                    ;
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ),
          Image.asset(
            AppImages.mosqueBottom,
            alignment: AlignmentGeometry.bottomCenter,
          ),
        ],
      ),
    );
  }
}
