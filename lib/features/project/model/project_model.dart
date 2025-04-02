import 'dart:convert';

class ProjectModel {
  final String projectId;
  final String name;
  final String link;
  final String desc;
  ProjectModel({
    required this.projectId,
    required this.name,
    required this.link,
    required this.desc,
  });

  ProjectModel copyWith({
    String? projectId,
    String? name,
    String? link,
    String? desc,
  }) {
    return ProjectModel(
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      link: link ?? this.link,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'name': name,
      'link': link,
      'desc': desc,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectId: map['projectId'] ?? '',
      name: map['name'] ?? '',
      link: map['link'] ?? '',
      desc: map['desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectModel(projectId: $projectId, name: $name, link: $link, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectModel &&
        other.projectId == projectId &&
        other.name == name &&
        other.link == link &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return projectId.hashCode ^ name.hashCode ^ link.hashCode ^ desc.hashCode;
  }
}
