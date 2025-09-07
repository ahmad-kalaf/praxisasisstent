import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.userChanges();

  Future<void> sendEmailVerification() async {
    try {
      await currentUser?.sendEmailVerification();
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-already-verified') {
          await reloadCurrentUser();
        } else if (e.code == 'user-not-found') {
          await signOut();
        } else if (e.code == 'user-disabled') {
          throw Exception('Benutzerkonto wurde vom Administrator deaktiviert.');
        } else if (e.code == 'too-many-requests') {
          throw Exception('Zu viele Anfragen. Bitte später erneut versuchen.');
        } else {
          throw Exception('Fehler bei der E-Mail-Bestätigung: ${e.message}');
        }
      } else {
        rethrow;
      }
    }
  }

  Future<User?> reloadCurrentUser() async {
    try {
      await currentUser?.reload();
      return currentUser;
    } on FirebaseAuthException {
      await signOut();
      return null;
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
