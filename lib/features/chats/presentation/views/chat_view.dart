import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/chats/presentation/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const String rn = '/chatView';
  final UserModel userModel;
  const ChatView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChatViewBody(userModel: userModel),
      ),
    );
  }
}
