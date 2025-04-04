import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider initializes FirebaseAuth and provides authentication functions.
final firebaseAuthPod = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);
