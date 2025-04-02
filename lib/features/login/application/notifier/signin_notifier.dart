import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/login/data/repo/login_repo_pod.dart';

class SigninNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    state = AsyncData(null);
    return future;
  }

  Future<void> signIn({
    required email,
    required password,
  }) async {
    state = AsyncLoading();
    final result =
        await ref.watch(loginRepoPod).signIn(email: email, password: password);
    return result.when((success) {
      state = AsyncData(null);
    }, (error) {
      state = AsyncError(error.code, StackTrace.current);
    });
  }
}
