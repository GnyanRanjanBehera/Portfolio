import 'package:flutter/material.dart';
import 'package:portfolio/shared/constant/app_assets.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Row(
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
        ),
        // Image.asset(
        //   AppAssets.instagram,
        //   fit: BoxFit.cover,
        //   width: w * 0.1,
        // ),
      ],
    );
  }
}
