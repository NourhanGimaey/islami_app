import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/screens/hadith_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/intro_screen.dart';
import 'package:islami/screens/prayer_time_screen.dart';
import 'package:islami/screens/quran_screen.dart';
import 'package:islami/screens/quran_verses.dart';
import 'package:islami/screens/radio_screen.dart';
import 'package:islami/screens/sibha_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkGrey,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.gold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.gold,
          // showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
          ),
          selectedItemColor: AppColors.white,
        ),
      ),
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranScreen.routeName: (context) => QuranScreen(),
        HadithScreen.routeName: (context) => HadithScreen(),
        SibhaScreen.routeName: (context) => SibhaScreen(),
        RadioScreen.routeName: (context) => RadioScreen(),
        PrayerTimeScreen.routeName: (context) => PrayerTimeScreen(),
        QuranVerses.routeName: (contect) => QuranVerses(),
      },
    );
  }
}
