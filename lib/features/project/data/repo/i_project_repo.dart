import 'package:portfolio/features/project/model/project_model.dart';

abstract class IProjectRepo {
  Future<void> saveProject({
    required name,
    required link,
    required desc,
  });

  Future<List<ProjectModel>> fetchProjects();

  Future<void> updateProject({
    required String id,
    String? name,
    String? link,
    String? desc,
  });

  Future<void> deleteProject({required String id});
}
