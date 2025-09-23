import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';

class SibhaScreen extends StatefulWidget {
  static const String routeName = 'Sibha Screen';
  const SibhaScreen({super.key});

  @override
  State<SibhaScreen> createState() => _SibhaScreenState();
}

class _SibhaScreenState extends State<SibhaScreen> {
  double _angle = 0.0;
  int counter = 1;
  int currentTasbih = 0;
  List<String> tasbihContent = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  void onClick() {
    counter++;
    if (counter >= 34) {
      counter = 1;
      currentTasbih++;
      if (currentTasbih >= 4) {
        currentTasbih = 0;
      }
    }
    _angle += math.pi / 18;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(fontSize: 36, color: AppColors.white),
          ),
          SizedBox(height: 24),
          Stack(
            children: [
              Image.asset(
                AppImages.sibhaTail,
                width: MediaQuery.of(context).size.width * .3,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Column(
                children: [
                  Text(
                    tasbihContent[currentTasbih],
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  onClick();
                },
                child: Transform.rotate(
                  angle: _angle,
                  child: Image.asset(AppImages.sibhaBody),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
