import 'package:flutter/material.dart';

class TransmissionListView extends StatelessWidget {
  const TransmissionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("Automatic"),
        ),
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text(
            "Tiptronic",
            style: TextStyle(color: Color(0xff171820)),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text(
            "Manual",
            style: TextStyle(color: Color(0xff171820)),
          ),
        ),
      ],
    );
  }
}
