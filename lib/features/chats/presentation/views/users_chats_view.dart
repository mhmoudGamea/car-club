import 'package:car_club/features/chats/presentation/model_views/cubit/chat_cubit.dart';
import 'package:car_club/features/chats/presentation/views/widgets/users_chats_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersChatsView extends StatelessWidget {
  static const String rn = '/searchView';
  const UsersChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getChats(),
      child: const Scaffold(
        body: SafeArea(
          child: UsersChatsViewBody(),
        ),
      ),
    );
  }
}
