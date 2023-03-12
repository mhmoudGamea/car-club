import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFiledWidget extends StatelessWidget {
  final bool? isEnabled;
  final TextEditingController controller;
  final String label;
  final TextInputType? type;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? maxLength;
  const TextFiledWidget({
    Key? key,
    this.isEnabled,
    required this.controller,
    required this.label,
    this.type,
    this.prefixIcon,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: babyBlue,
      enabled: isEnabled ?? true,
      keyboardType: type ?? TextInputType.name,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(
          label,
          style: Styles.title13,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: babyBlue, width: 2),
        ),
        prefixIcon: prefixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
    );
  }
}
