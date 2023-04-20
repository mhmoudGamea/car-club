import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../model_views/cubit/chat_cubit.dart';
import '../chat_view.dart';
import 'chat_search_text_field.dart';
import 'no_user_found_widget.dart';
import 'user_chat_item.dart';

class ChatSearchViewBody extends StatelessWidget {
  const ChatSearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ChatCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChatSearchTextField(
              onChange: (name) {
                data.getSearchUsersChats(name: name);
              },
              onPress: () {
                data.getSearchUsersChats(name: data.getSearchController.text);
              },
              controller: data.getSearchController),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is UsersSearchChatsLoading) {
                return Container(
                  height: 10,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: const LinearProgressIndicator(
                      color: mintGreen, backgroundColor: greyColor),
                );
              } else if (state is UsersSearchChatsSuccess) {
                // print();
                if (state.chats.isEmpty) {
                  return const NoUserFoundWidget();
                }
                return Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                return Text(state is UsersSearchChatsFailure
                    ? 'Error'
                    : 'texting'); // TODO: put a nice error message here instead of text
              }
            },
          ),
        ],
      ),
    );
  }
}
