import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});


  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

void filterChapters (String text){

}

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        filterChapters(text);
      },
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          // ignore: deprecated_member_use
          child: SvgPicture.asset(AppIcons.icQuran, color: AppColors.gold),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 28, minHeight: 28),
        hintText: 'Search Name',
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
      ),
    );
  }
}
