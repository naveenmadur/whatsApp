// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/bloc/users_bloc/users_bloc.dart';
import 'package:whats_app/presentation/widgets/custom_circular_progress_indicator.dart';

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(GetCurrentUser());
    BlocProvider.of<UsersBloc>(context).add(GetAllUsers());
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is UserDetails) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You have not started chatting with anyone. Start now by finding your friends!',
                textAlign: TextAlign.center,
              )
              // StreamBuilder(
              //   stream: ,
              //   builder: );
            ],
          ),
        );
      } else {
        return Center(
          child: CustomCircularProgressIndicator(),
        );
      }
    });
  }
}
