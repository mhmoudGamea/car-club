import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class DialogTextFieldWidget extends StatelessWidget {
  final Color cursorColor;
  final TextEditingController controller;
  final String label;
  final Color borderColor;
  final VoidCallback onPress;
  const DialogTextFieldWidget(
      {Key? key,
      required this.cursorColor,
      required this.controller,
      required this.label,
      required this.borderColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: cursorColor,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: Styles.title13.copyWith(color: Colors.black),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            FontAwesomeIcons.xmark,
            size: 18,
            color: Colors.black,
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
