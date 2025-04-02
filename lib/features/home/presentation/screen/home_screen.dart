import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/shared/widget/drawer_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: DrawerWidget(currentPage: "HomeRoute"),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
