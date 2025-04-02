import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/shared/widget/button_widget.dart';
import 'package:portfolio/shared/widget/drawer_widget.dart';
import 'package:portfolio/shared/widget/text_field_widget.dart';

@RoutePage()
class ProjectEntryScreen extends StatefulWidget {
  const ProjectEntryScreen({super.key});

  @override
  ProjectEntryScreenState createState() => ProjectEntryScreenState();
}

class ProjectEntryScreenState extends State<ProjectEntryScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Project Entry"),
        ),
        drawer: DrawerWidget(currentPage: "ProjectEntryRoute"),
        bottomNavigationBar: ButtonWidget(
          onPressed: () {},
          text: "Submit",
        ),
        body: Padding(
          padding: EdgeInsets.all(h * 0.01),
          child: Column(
            spacing: h * 0.02,
            children: [
              TextFieldWidget(
                hintText: "Enter project name",
                prefixIcon: Icon(Icons.language),
                controller: _nameController,
              ),
              TextFieldWidget(
                hintText: "Enter project link",
                controller: _linkController,
                prefixIcon: Icon(Icons.share),
              ),
              TextFieldWidget(
                hintText: "Enter project description",
                controller: _descController,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                minLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
