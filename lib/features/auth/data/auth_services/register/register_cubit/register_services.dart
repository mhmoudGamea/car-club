import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<UserCredential> createUserWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  return await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
}

Future<UserCredential> signInWithFacebook() async {
  final LoginResult signInResult = await FacebookAuth.instance.login();

  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(signInResult.accessToken!.token);

  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
