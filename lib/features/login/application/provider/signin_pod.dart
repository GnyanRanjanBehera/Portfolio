import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/login/application/notifier/signin_notifier.dart';

final signinPod = AutoDisposeAsyncNotifierProvider<SigninNotifier, void>(
  () => SigninNotifier(),
);
