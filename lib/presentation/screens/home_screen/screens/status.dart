import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/presentation/bloc/users_bloc/users_bloc.dart';
import 'package:whats_app/presentation/screens/chat/chat_screen.dart';
import 'package:whats_app/presentation/widgets/custom_circular_progress_indicator.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      BlocProvider.of<UsersBloc>(context).add(GetAllUsers());
      if (state is AllUsers) {
        return Expanded(
          child: Container(
            child: StreamBuilder(
              stream: state.snapshot,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                email: snapshot.data[index]['email']),
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
                              snapshot.data[index]['email']
                                  .substring(0, 1)
                                  .toUpperCase(),
                            ),
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        title: Text(snapshot.data[index]['email']),
                        subtitle: Text(snapshot.data[index]['uid']),
                      ),
                    );
                  },
                  itemCount: 2,
                );
              },
            ),
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
