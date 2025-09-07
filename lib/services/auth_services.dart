import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.userChanges();

  Future<User?> reloadCurrentUser() async {
    try {
      await currentUser?.reload();
      return currentUser;
    } on FirebaseAuthException {
      // if (e.code == 'user-disabled' || e.code == 'user-not-found') {
      //   // Lokale Abmeldung erzwingen
      await signOut();
      return null;
      // } else {
      //   rethrow; // andere Fehler weiterwerfen
      // }
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
