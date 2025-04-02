import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/project/data/repo/i_project_repo.dart';
import 'package:portfolio/features/project/data/repo/project_repo.dart';
import 'package:portfolio/shared/pods/firebase_firestore_pod.dart';

final projectRepoPod = Provider.autoDispose<IProjectRepo>(
  (ref) => ProjectRepo(
    firestore: ref.watch(firebaseFirestorePod),
  ),
);
