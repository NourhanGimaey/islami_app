import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/main_layout/radio/provider/radio_provider.dart';
import 'package:islami/main_layout/radio/widgets/radio_card.dart';
import 'package:islami/main_layout/radio/widgets/reciters_card.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = '/radio_screen';
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedToggleSwitch<int>.size(
            textDirection: TextDirection.ltr,
            current: context.watch<RadioProvider>().currentValue,
            values: const [0, 1],
            iconOpacity: 1,
            indicatorSize: Size(
              MediaQuery.sizeOf(context).width * 0.5,
              double.infinity,
            ),
            iconList: [
              Text(
                "Radio",
                style: context.read<RadioProvider>().textStyleSwitcher(0),
              ),
              Text(
                "Reciters",
                style: context.read<RadioProvider>().textStyleSwitcher(1),
              ),
            ],
            borderWidth: 0.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              backgroundColor: AppColors.black.withValues(alpha: .7),
              indicatorColor: AppColors.gold,
            ),
            onChanged: (value) =>
                context.read<RadioProvider>().changeValue(value),
            onTap: (props) {
              if (props.tapped?.index == 0) {
                context.read<RadioProvider>().getRadio();
              } else {
                context.read<RadioProvider>().getReciters();
              }
            },
          ),
        ),
        Consumer<RadioProvider>(
          builder: (context, provider, child) {
            if (provider.currentValue == 0) {
              if (provider.radioLoading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.gold),
                  ),
                );
              } else if (provider.radioFailureMessage.isNotEmpty) {
                return Expanded(
                  child: Center(child: Text(provider.radioFailureMessage)),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return RadioCard(radio: provider.radios[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: provider.radios.length,
                  ),
                );
              }
            } else {
              if (provider.recitersLoading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.gold),
                  ),
                );
              } else if (provider.recitersFailureMessage.isNotEmpty) {
                return Expanded(
                  child: Center(child: Text(provider.recitersFailureMessage)),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return RecitersCard(reciter: provider.reciters[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: provider.reciters.length,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
