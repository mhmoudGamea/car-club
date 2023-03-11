import 'package:flutter/material.dart';

class Progress {
  // FadingCircle

  static Widget circleProgress() {
    return SizedBox(
      height: 17,
      width: 17,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white.withAlpha(30),
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
  }
}
