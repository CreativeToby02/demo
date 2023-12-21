import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google sign in
  signInWithGoogle() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final GoogleSignInAccount? _googleUser = await GoogleSignIn().signIn();

    try {
      if (_googleUser != null) {
        // ignore: no_leading_underscores_for_local_identifiers
        final GoogleSignInAuthentication _googleAuth =
            await _googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: _googleAuth.accessToken,
          idToken: _googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        print(credential);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
