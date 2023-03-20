import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ExpandedWidget extends StatefulWidget {
  final String description;
  const ExpandedWidget({Key? key, required this.description}) : super(key: key);

  @override
  ExpandedWidgetState createState() => ExpandedWidgetState();
}

class ExpandedWidgetState extends State<ExpandedWidget> {
  late String firstHalf;
  late String secondHalf;
  var tapped = false;

  @override
  void initState() {
    super.initState();
    if (widget.description.length >= 120) {
      firstHalf = widget.description.substring(0, 120);
      secondHalf = widget.description.substring(121, widget.description.length);
    } else {
      firstHalf = widget.description;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf == ''
        ? Text(
            firstHalf,
            style: Styles.title13.copyWith(letterSpacing: 1),
          )
        : Column(
            children: [
              Text(
                tapped ? widget.description : firstHalf,
                style: Styles.title13.copyWith(letterSpacing: 1),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    tapped = !tapped;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      tapped ? 'Show less' : 'Show more',
                      style: Styles.title14.copyWith(
                        // color: const Color(0xffB7DFFF),
                        color: babyBlue,
                      ),
                    ),
                    Icon(
                      tapped
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      // color: const Color(0xffB7DFFF),
                      color: babyBlue,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
