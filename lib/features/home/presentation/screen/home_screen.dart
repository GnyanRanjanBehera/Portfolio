import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/theme_pod.dart';
import 'package:portfolio/features/home/presentation/widget/social_media_card.dart';
import 'package:portfolio/features/home/presentation/widget/theme_mode_switch.dart';
import 'package:portfolio/shared/constant/app_assets.dart';
import 'package:portfolio/shared/widget/drawer_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(currentPage: "HomeRoute"),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssets.profilePic,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Text("I am Gyana"),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: SocialMediaCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
