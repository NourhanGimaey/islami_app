import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = '/radio_screen';
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.gold, child: Text('Radio'));
  }
}
