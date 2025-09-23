import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/quran_data.dart';
import 'package:islami/core/widgets/search_widget.dart';
import 'package:islami/screens/quran_verses.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = '/quran_screen';
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWidget(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              QuranData quranData = QuranData.getQuranChapter()[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    QuranVerses.routeName,
                    arguments: quranData,
                  );
                },
                child: ListTile(
                  title: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentGeometry.center,
                          children: [
                            Image.asset(
                              AppImages.verseBorder,
                              width: 52,
                              height: 52,
                            ),
                            Text(
                              '${index + 1}',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quranData.englishQuranName,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                            Text(
                              quranData.verseNumber,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Text(
                    quranData.arabicQuranName,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: AppColors.white),
                  ),
                ),
              );
            },
            separatorBuilder: (context, int index) {
              return Divider(color: AppColors.white, indent: 64, endIndent: 64);
            },
            itemCount: QuranData.getQuranChapter().length,
          ),
        ),
      ],
    );
  }
}
