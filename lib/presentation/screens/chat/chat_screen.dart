// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:whats_app/presentation/screens/home_screen/widgets/app_bar_actions_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    BlocProvider.of<MessageBloc>(context).add(GetMessageEvent());
    super.initState();
  }

  Stream<QuerySnapshot>? chats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.primary_green),
        title: Text(
          widget.email,
          style: TextStyles.homescreenAppBarTextStyle,
        ),
        elevation: 0,
        actions: [
          AppBarAcionsContainer(icon: Icons.phone_outlined, ontap: () {}),
          SizedBox(
            width: 10,
          ),
          AppBarAcionsContainer(icon: Icons.videocam_outlined, ontap: () {}),
        ],
        backgroundColor: ColorConstants.light_background,
      ),
    );
  }
}
