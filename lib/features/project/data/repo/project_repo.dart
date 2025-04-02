import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/project/data/repo/i_project_repo.dart';
import 'package:portfolio/features/project/model/project_model.dart';

class ProjectRepo extends IProjectRepo {
  final FirebaseFirestore firestore;
  ProjectRepo({required this.firestore});

  @override
  Future<void> saveProject({
    required name,
    required link,
    required desc,
  }) async {
    CollectionReference collection = firestore.collection("project");

    await collection.add({
      'name': name,
      'link': link,
      "desc": desc,
    });

    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> fetchProjects() async {
    CollectionReference collection = firestore.collection('project');
    QuerySnapshot querySnapshot = await collection.get();

    List<ProjectModel> projects = querySnapshot.docs.map((doc) {
      return ProjectModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    return projects;
  }

  @override
  Future<void> deleteProject({
    required String id,
  }) async {
    await firestore.collection("project").doc(id).delete();
  }

  @override
  Future<void> updateProject({
    required String id,
    String? name,
    String? link,
    String? desc,
  }) async {
    CollectionReference collection = firestore.collection("project");
    await collection.doc(id).update({
      if (name != null) "name": name,
      if (desc != null) "desc": desc,
      if (link != null) "link": link,
    });
  }
}
