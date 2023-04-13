import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/chats/presentation/views/widgets/chat_app_bar.dart';
import 'package:car_club/features/chats/presentation/views/widgets/send_message_widget.dart';
import 'package:flutter/material.dart';

import 'chat_body_content.dart';

class ChatViewBody extends StatelessWidget {
  final UserModel userModel;
  const ChatViewBody({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatAppBar(name: userModel.name, image: userModel.profileImage),
        Expanded(
          child: ChatBodyContent(userModel: userModel),
        ),
        SendMessageWidget(userModel: userModel)
      ],
    );
  }
}
