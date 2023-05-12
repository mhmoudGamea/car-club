import 'package:car_club/core/constants.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/chats/presentation/model_views/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class SendMessageWidget extends StatelessWidget {
  final UserModel userModel;
  SendMessageWidget({Key? key, required this.userModel}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ChatCubit>(context);
    String? message;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            height: 55,
            margin:
                const EdgeInsets.only(right: 5, left: 10, top: 5, bottom: 5),
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
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        hintStyle: Styles.title14.copyWith(color: blackColor)),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_controller.text.isNotEmpty) {
                      message = _controller.text;
                      _controller.clear();
                      await data.sendMessage(message!);
                    }
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
            ),
          ),
        ),
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return SizedBox(
              height: data.getMoreStatus ? 140 : 50,
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(data.getMoreStatus ? 10 : 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: mintGreen,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(1, 1),
                              )
                            ],
                          ),
                          child: Image.asset(
                              data.getMoreStatus
                                  ? 'assets/chat/cross.png'
                                  : 'assets/chat/plus.png',
                              color: whiteColor),
                        ),
                      ),
                      onTap: () {
                        data.addMoreStates();
                      },
                    ),
                  ),
                  if (data.getMoreStatus)
                    Positioned(
                      right: 5,
                      bottom: 55,
                      width: 40,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              data.pickImage();
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Image.asset(
                                'assets/chat/image.png',
                                color: mintGreen,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              data.pickCameraImage();
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Image.asset(
                                'assets/chat/camera.png',
                                color: mintGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
/*
Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(data.getMoreStatus ? 10 : 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mintGreen,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(1, 1),
                          )
                        ],
                      ),
                      child: Image.asset(
                          data.getMoreStatus
                              ? 'assets/chat/cross.png'
                              : 'assets/chat/plus.png',
                          color: whiteColor),
                    ),
                  ),
                  onTap: () {
                    data.addMoreStates();
                  },
                ),
                if (data.getMoreStatus)
                  
              ],
            )

*/