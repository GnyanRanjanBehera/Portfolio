import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/login/data/repo/login_repo.dart';
import 'package:portfolio/shared/pods/firebase_auth_pod.dart';

final loginRepoPod = Provider.autoDispose(
  (ref) => LoginRepo(auth: ref.watch(firebaseAuthPod)),
);
