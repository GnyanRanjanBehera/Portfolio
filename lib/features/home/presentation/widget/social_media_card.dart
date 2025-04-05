import 'package:flutter/material.dart';
import 'package:portfolio/shared/constant/app_assets.dart';
import 'package:portfolio/shared/constant/app_colors.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(w * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: w * 0.06,
        children: [
          Image.asset(
            AppAssets.linkedin,
            fit: BoxFit.cover,
            width: w * 0.1,
          ),
          Image.asset(
            AppAssets.github,
            fit: BoxFit.cover,
            width: w * 0.1,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.white
                : AppColors.white,
          ),
          Image.asset(
            AppAssets.instagram,
            fit: BoxFit.cover,
            width: w * 0.1,
          ),
        ],
      ),
    );
  }
}
