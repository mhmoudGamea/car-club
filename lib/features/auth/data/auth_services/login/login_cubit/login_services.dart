import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:google_sign_in/google_sign_in.dart';

Future<void> sendPasswordResetEmail(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

Future<UserCredential> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  return await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

// Future<UserCredential> signInWithGoogle()async {
//   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken
//   );
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

FacebookLogin facebookLogin = FacebookLogin();
Future<void> signInWithFacebook() async {
  FacebookLoginResult result = await facebookLogin.logIn(customPermissions: ['email']);
  final token = result.accessToken!.token;
  if(result.status == FacebookLoginStatus.success){
    final faceCredential = FacebookAuthProvider.credential(token);
    await FirebaseAuth.instance.signInWithCredential(faceCredential);
  }

}

Future<UserCredential> signInWithApple() async {
  final rawNonce = generateNonce();
  final nonce = sha256ofString(rawNonce);
  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce,
  );
  final oauthCredential = OAuthProvider("apple.com").credential(
    idToken: appleCredential.identityToken,
    rawNonce: rawNonce,
  );
  return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
}

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
