import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/chats/data/repos/chat_repo_impl.dart';
import 'package:car_club/features/chats/presentation/model_views/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/chat_search_view_body.dart';

class ChatSearchView extends StatelessWidget {
  static const String rn = '/chatSearchView';
  const ChatSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(ChatRepoImpl())..getSearchUsersChats(),
      child: Scaffold(
        appBar: Helper.normalAppBar(
            context: context,
            title: 'Search',
            backgroundColor: whiteColor,
            elevation: 1,
            iconSize: 20),
        body: const SafeArea(
          child: ChatSearchViewBody(),
        ),
      ),
    );
  }
}
