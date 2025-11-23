import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/main_layout/radio/models/reciters_model.dart';
import 'package:islami/main_layout/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class RecitersCard extends StatelessWidget {
  final Reciters reciter;
  const RecitersCard({super.key, required this.reciter});

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
                      reciter.name ?? '',
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
                            provider.previousSura(reciter);
                          },
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            size: 40,
                            color: AppColors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.playReciters(reciter);
                          },
                          icon: Icon(
                            provider.selectedReciter == reciter
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 56,
                            color: AppColors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.nextSura(reciter);
                          },
                          icon: Icon(
                            Icons.skip_next_rounded,
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
