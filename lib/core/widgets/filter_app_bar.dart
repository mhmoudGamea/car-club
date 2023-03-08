import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Filters",
          style: Styles.title16.copyWith(
            color: const Color(0xff171820),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 90,
        ),
        TextButton(
          onPressed: () {},
          child: const Text("RESET"),
        ),
      ],
    );
  }
}
