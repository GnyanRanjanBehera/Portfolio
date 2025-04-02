import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/router/app_router.gr.dart';
import 'package:portfolio/shared/constant/app_colors.dart';
import 'package:portfolio/shared/constant/app_defaults.dart';

class DrawerWidget extends ConsumerWidget {
  final String currentPage;
  const DrawerWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0), children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  " AppAssets.user",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        DrawerTile(
          icon: Icons.dashboard,
          onTap: () {
            if (currentPage != "HomeRoute") {
              context.navigateTo(HomeRoute());
              Navigator.pop(context);
            }
          },
          title: "Home",
          isSelected: currentPage == "HomeRoute" ? true : false,
        ),
        DrawerTile(
          icon: Icons.language,
          onTap: () {
            if (currentPage != "ProjectEntryRoute") {
              context.navigateTo(ProjectEntryRoute());
              Navigator.pop(context);
            }
          },
          title: "Add Project",
          isSelected: currentPage == "ProjectEntryRoute" ? true : false,
        ),
      ]),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;
  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 10),
        decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.zero,
            topLeft: Radius.zero,
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          leading: Icon(
            icon,
            color: isSelected
                ? AppColors.white
                : Theme.of(context).colorScheme.primary,
          ),
          title: Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected
                        ? AppColors.white
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
        ),
      ),
    );
  }
}
