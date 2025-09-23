import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_tabs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              currentTabIndex == 0
                  ? AppImages.quranBackground
                  : currentTabIndex == 1
                  ? AppImages.hadithBackground
                  : currentTabIndex == 2
                  ? AppImages.sibhaBackground
                  : currentTabIndex == 3
                  ? AppImages.radioBackground
                  : AppImages.prayerTimeBackground,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withValues(alpha: 1),
                  AppColors.black.withValues(alpha: .6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AppImages.islamiTopLogo,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(flex: 4, child: tabs[currentTabIndex]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (tappedIndex) {
          setState(() {
            currentTabIndex = tappedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.gold,
            icon: SvgPicture.asset(AppIcons.icQuran),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.gold,

            icon: SvgPicture.asset(AppIcons.icHadith),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.gold,

            icon: SvgPicture.asset(AppIcons.icSibha),
            label: 'Sibha',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.gold,

            icon: SvgPicture.asset(AppIcons.icRadio),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.gold,

            icon: SvgPicture.asset(AppIcons.icTime),
            label: 'Prayer Time',
          ),
        ],
      ),
    );
  }
}
