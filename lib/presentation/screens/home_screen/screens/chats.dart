import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/domain/entities/user_entity.dart';
import 'package:whats_app/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:whats_app/presentation/bloc/users_bloc/users_bloc.dart';
import 'package:whats_app/presentation/screens/chat/chat_screen.dart';
import 'package:whats_app/presentation/widgets/custom_circular_progress_indicator.dart';

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
  }) : super(key: key);

  Future<String> getCurrentUser() async {
    final currentUserId = await FirebaseAuth.instance.currentUser!.uid;
    return currentUserId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is UsersInitial) {
          BlocProvider.of<UsersBloc>(context).add(GetAllUsers());
        }
        if (state is AllUsers) {
          return Expanded(
            child: Container(
              child: StreamBuilder<List<UserEntity>>(
                stream: state.userStream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomCircularProgressIndicator();
                  } else if (!snapshot.hasData) {
                    return CustomCircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final id = await getCurrentUser();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  List<String> ids = [
                                    id,
                                    snapshot.data[index].uid
                                  ]..sort();
                                  final chatId = ids[0] + '_' + ids[1];
                                  BlocProvider.of<MessageBloc>(context)
                                      .add(GetMessageEvent(key: chatId));
                                  return ChatScreen(
                                    email: snapshot.data[index].email,
                                    currentUserId: id,
                                    receiverId: snapshot.data[index].uid,
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 34,
                              backgroundColor: ColorConstants.primary_green,
                              child: CircleAvatar(
                                backgroundColor: ColorConstants.light_red,
                                radius: 27,
                                child: Text(
                                  snapshot.data[index].email
                                      .substring(0, 1)
                                      .toUpperCase(),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            title: Text(snapshot.data[index].email),
                            // subtitle: Text(snapshot.data[index]['uid']),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  } else {
                    return CustomCircularProgressIndicator();
                  }
                },
              ),
            ),
          );
        } else {
          return Center(
            child: CustomCircularProgressIndicator(),
          );
        }
      },
    );
  }
}
