// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_constants.dart';
import 'package:whats_app/presentation/bloc/homescreen_bloc/homescreen_bloc.dart';
import 'package:whats_app/presentation/screens/home_screen/screens/calls.dart';
import 'package:whats_app/presentation/screens/home_screen/screens/chats.dart';
import 'package:whats_app/presentation/screens/home_screen/screens/status.dart';
import 'package:whats_app/presentation/screens/home_screen/widgets/app_bar_actions_container.dart';
import 'package:whats_app/presentation/screens/home_screen/widgets/custom_pop_up_menu_button.dart';
import 'package:whats_app/presentation/screens/home_screen/widgets/top_nav_bar_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextConstants.homeScreenAppBarText,
        elevation: 0,
        centerTitle: false,
        backgroundColor: ColorConstants.light_background,
        actions: [
          AppBarAcionsContainer(
            icon: Icons.search,
            ontap: () {},
          ),
          CustomPopUpMenuButton(),
        ],
      ),
      body: BlocBuilder<HomescreenBloc, HomescreenState>(
        builder: (context, state) {
          if (state is HomescreenInitial) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorConstants.light_grey,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TopNavBarContainer(
                          label: 'CHATS',
                          onTap: () {
                            BlocProvider.of<HomescreenBloc>(context)
                                .add(ChatsEvent());
                          },
                          isActive: state.chat,
                        ),
                        TopNavBarContainer(
                          label: 'STATUS',
                          onTap: () {
                            BlocProvider.of<HomescreenBloc>(context)
                                .add(StatusEvent());
                          },
                          isActive: state.status,
                        ),
                        TopNavBarContainer(
                          label: 'CALLS',
                          onTap: () {
                            BlocProvider.of<HomescreenBloc>(context)
                                .add(CallsEvent());
                          },
                          isActive: state.call,
                        ),
                      ],
                    ),
                  ),
                  if (state.currentScreen == HomeScreenPages.chats) Chats(),
                  if (state.currentScreen == HomeScreenPages.status) Status(),
                  if (state.currentScreen == HomeScreenPages.calls) Calls(),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
