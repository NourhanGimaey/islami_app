import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/main_layout/radio/models/radio_model.dart';
import 'package:islami/main_layout/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class RadioCard extends StatelessWidget {
  final Radios radio;
  const RadioCard({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset(AppImages.radioCardBackground),
          Consumer<RadioProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      radio.name ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 56),
                        IconButton(
                          onPressed: () {
                            provider.playRadio(radio);
                          },
                          icon: Icon(
                            provider.selecteRadio == radio
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 56,
                            color: AppColors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.changeVolume(radio);
                          },
                          icon: Icon(
                            provider.selectedVolume == radio
                                ? Icons.volume_off_rounded
                                : Icons.volume_up_rounded,
                            size: 40,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
