import 'package:flutter/material.dart';

class FuelListView extends StatelessWidget {
  const FuelListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text(
            "Petrol",
            style: TextStyle(color: Color(0xff171820)),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Diesel"),
        ),
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text(
            "Hybrid",
            style: TextStyle(color: Color(0xff171820)),
          ),
        ),
      ],
    );
  }
}
