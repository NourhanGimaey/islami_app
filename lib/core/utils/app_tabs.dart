import 'package:flutter/material.dart';
import 'package:islami/screens/hadith_screen.dart';
import 'package:islami/screens/prayer_time_screen.dart';
import 'package:islami/screens/quran_screen.dart';
import 'package:islami/screens/radio_screen.dart';
import 'package:islami/screens/sibha_screen.dart';

List<Widget> tabs = [
  QuranScreen(),
  HadithScreen(),
  SibhaScreen(),
  RadioScreen(),
  PrayerTimeScreen(),
];
