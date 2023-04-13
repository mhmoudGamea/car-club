import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMessageWidget extends StatelessWidget {
  SendMessageWidget({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.6),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                style: Styles.title14.copyWith(color: blackColor),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type something...',
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    hintStyle: Styles.title14.copyWith(color: blackColor)),
              ),
            ),
            GestureDetector(
              onTap: () {
                // data.sendMessage(
                //     receiver: receiverId,
                //     message: _controller.text,
                //     date: DateTime.now().toIso8601String());
                // print('Message send');
                _controller.clear();
              },
              child: Container(
                width: 65,
                height: 55,
                decoration: const BoxDecoration(
                  color: mintGreen,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  FontAwesomeIcons.paperPlane,
                  size: 20,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ));
  }
}
