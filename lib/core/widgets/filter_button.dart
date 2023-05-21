import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const FilterButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
