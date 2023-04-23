import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:whats_app/presentation/screens/chat/widgets/chat_container.dart';
import 'package:whats_app/presentation/screens/chat/widgets/chat_text_field.dart';
import 'package:whats_app/presentation/screens/chat/widgets/send_button.dart';
import 'package:whats_app/presentation/screens/home_screen/widgets/app_bar_actions_container.dart';
import 'package:whats_app/presentation/widgets/custom_circular_progress_indicator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.email,
    required this.currentUserId,
    required this.receiverId,
  }) : super(key: key);
  final String email;
  final String currentUserId;
  final String receiverId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();

  String getChatId() {
    List<String> ids = [widget.currentUserId, widget.receiverId]..sort();
    final id = ids[0] + '_' + ids[1];
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorConstants.primary_green,
        ),
        title: Text(
          widget.email,
          style: TextStyles.homescreenAppBarTextStyle,
        ),
        elevation: 0,
        actions: [
          AppBarActionsContainer(icon: Icons.phone_outlined, onTap: () {}),
          AppBarActionsContainer(icon: Icons.videocam_outlined, onTap: () {}),
        ],
        backgroundColor: ColorConstants.light_background,
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is MessageInitial) {
            return CustomCircularProgressIndicator();
          } else if (state is AllMessages) {
            return StreamBuilder(
              stream: state.messages,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CustomCircularProgressIndicator();
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'You have not started a chat with this user yet...',
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final bool receiver =
                                  (snapshot.data![index].receiverId ==
                                      widget.receiverId);
                              return ChatContainer(
                                receiver: receiver,
                                snapshot: snapshot,
                                index: index,
                              );
                            },
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ChatTextField(
                                    focusNode: _focusNode,
                                    controller: _controller,
                                    onTap: () {
                                      setState(() {
                                        _focusNode.requestFocus();
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  SendButton(
                                    controller: _controller,
                                    onTap: () {
                                      if (_controller.text.isNotEmpty) {
                                        MessageEntity message = MessageEntity(
                                          message: _controller.text,
                                          createdTime:
                                              DateTime.now().toString(),
                                          senderId: widget.currentUserId,
                                          receiverId: widget.receiverId,
                                        );
                                        BlocProvider.of<MessageBloc>(context)
                                            .add(
                                          PostMessageEvent(
                                            message: message,
                                            key: getChatId(),
                                          ),
                                        );
                                      }
                                      _controller.clear();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return CustomCircularProgressIndicator();
                }
              },
            );
          } else {
            return CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }
}
