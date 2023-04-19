import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';

class ChatSearchTextField extends StatelessWidget {
  final VoidCallback onPress;
  final Function(String)? onChange;
  final TextEditingController controller;
  const ChatSearchTextField(
      {Key? key,
      required this.onPress,
      required this.controller,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      cursorColor: blackColor,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: greyColor.withOpacity(0.2),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
        hintText: 'Search...',
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
        suffixIcon: IconButton(
          onPressed: onPress,
          icon: const Icon(
            Icons.search_rounded,
            color: blackColor,
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder border() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: greyColor, width: 3),
    );
  }
}
