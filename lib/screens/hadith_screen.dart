import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/hadith_data.dart';

class HadithScreen extends StatefulWidget {
  static const String routeName = '/hadith_screen';
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

List<HadithData> allHadith = [];

class _HadithScreenState extends State<HadithScreen> {
  void loadHadith() async {
    String content = await rootBundle.loadString(
      "assets/files/hadith/all_hadith.txt",
    );
    List<String> hadithContent = content.trim().split('#');
    for (int i = 0; i < hadithContent.length - 1; i++) {
      String singleHadithContent = hadithContent[i].trim();
      int indexOfFirstLine = singleHadithContent.indexOf('\n');
      String hadithTitle = singleHadithContent.substring(0, indexOfFirstLine);
      String fullHadith = singleHadithContent.substring(indexOfFirstLine);

      HadithData hadith = HadithData(hadithTitle, fullHadith);
      allHadith.add(hadith);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (allHadith.isEmpty) {
      loadHadith();
    }
    return CarouselSlider.builder(
      itemCount: allHadith.length,
      itemBuilder:
          (BuildContext context, int currentIndex, int pageViewIndex) =>
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(AppImages.hadithCard),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Text(
                      allHadith[currentIndex].hadithTitle,
                      style: TextStyle(fontSize: 16, color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Text(
                      allHadith[currentIndex].fullHadith,
                      style: TextStyle(fontSize: 16, color: AppColors.black),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .64,
        viewportFraction: .7,
        enlargeCenterPage: true,
        enlargeFactor: .2,
      ),
    );
  }
}
