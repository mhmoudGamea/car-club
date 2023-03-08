import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
class OrSignInText extends StatelessWidget {
  const OrSignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 1, width: 94.4, color: const Color(0xff424040)),
        const Text(
          'or sign up with ',
          style: Styles.authCustomTitle,
        ),
        Container(
            height: 1, width: 94.4, color: const Color(0xff424040)),
      ],
    );
  }
}
