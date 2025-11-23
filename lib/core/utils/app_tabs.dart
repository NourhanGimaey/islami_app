import 'package:flutter/material.dart';
import 'package:islami/main_layout/hadith_screen.dart';
import 'package:islami/main_layout/prayer_time_screen.dart';
import 'package:islami/main_layout/quran/quran_screen.dart';
import 'package:islami/main_layout/radio/provider/radio_provider.dart';
import 'package:islami/main_layout/radio/screens/radio_screen.dart';
import 'package:islami/main_layout/sibha_screen.dart';
import 'package:provider/provider.dart';

List<Widget> tabs = [
  QuranScreen(),
  HadithScreen(),
  SibhaScreen(),
  ChangeNotifierProvider<RadioProvider>(
    create: (context) => RadioProvider(),
    child: RadioScreen(),
  ),
  PrayerTimeScreen(),
];
