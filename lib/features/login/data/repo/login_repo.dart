import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:portfolio/features/login/data/repo/i_login_repo.dart';

class LoginRepo extends ILoginRepo {
  final FirebaseAuth auth;
  LoginRepo({required this.auth});
  @override
  Future<Result<User, FirebaseAuthException>> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return Success(userCredential.user!);
  }
}
