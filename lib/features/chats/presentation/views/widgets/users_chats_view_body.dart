import 'package:car_club/core/widgets/details_app_bar.dart';
import 'package:car_club/features/chats/presentation/model_views/cubit/chat_cubit.dart';
import 'package:car_club/features/chats/presentation/views/chat_view.dart';
import 'package:car_club/features/chats/presentation/views/widgets/user_chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';

class UsersChatsViewBody extends StatelessWidget {
  const UsersChatsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsAppBar(
            text: 'Chats',
            icon: Icons.search_rounded,
            onpress: () {
              //TODO: handle search about specific user chat here
            }),
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is UsersChatsLoading) {
              return Container(
                height: 10,
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 120, right: 120),
                child: const LinearProgressIndicator(
                    color: mintGreen, backgroundColor: greyColor),
              );
            } else if (state is UsersChatsSuccess) {
              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: state.chats.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(ChatView.rn, extra: state.chats[index]);
                    },
                    child: UserChatItem(userModel: state.chats[index]),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                ),
              );
            } else {
              return Text(state is UsersChatsFailure
                  ? 'Error'
                  : 'texting'); // TODO: put a nice error message here instead of text
            }
          },
        ),
      ],
    );
  }
}
