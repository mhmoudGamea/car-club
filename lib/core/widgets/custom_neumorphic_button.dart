import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../utils/styles.dart';

class CustomNeumorphicButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPress;
  final Color? textColor;
  const CustomNeumorphicButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.onPress,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPress,
      padding: const EdgeInsets.symmetric(vertical: 15),
      style: NeumorphicStyle(depth: 1, color: backgroundColor),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Styles.title15.copyWith(color: textColor ?? Colors.black),
      ),
    );
  }
}
