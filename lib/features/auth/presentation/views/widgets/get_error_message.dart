import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

String getErrorMessage(error) {
  switch (error.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    // break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email or password .";
    // break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
    // break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";
    // break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    // break;
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Server error, please try again later.";
    // break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";
    // break;
    default:
      return "Login failed. Please try again.";
    // break;
  }
}

void authErrorHandle({required BuildContext context, required dynamic state}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Error'),
            titleTextStyle: const TextStyle(
              color: secondaryLoginColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            content: Text(getErrorMessage(state.error)),
            contentTextStyle: const TextStyle(
              fontSize: 18,
              color: secondaryLoginColor,
            ),
            backgroundColor: whiteColor,
      ));
}
