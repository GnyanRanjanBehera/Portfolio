import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepo {
  Future<Result<User,FirebaseAuthException>> signIn({
    required String email,
    required String password,
  });
}
