import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          'Dataaaaa',
          style: Styles.title16.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
