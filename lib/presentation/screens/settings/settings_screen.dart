import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/presentation/screens/profile/profile_screen.dart';
import 'package:whats_app/presentation/screens/settings/widgets/actions_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      appBar: AppBar(
        leading: IconConstants.appBarLeadingIcon(onTap: () {
          Navigator.of(context).pop();
        }),
        title: Text(
          'Settings',
          style: TextStyles.homescreenAppBarTextStyle,
        ),
        backgroundColor: ColorConstants.light_background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Divider(thickness: 1),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: ColorConstants.light_green,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Daniel Sebastian',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('danielSebastian@gmail.com'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Avaliable')
                            ],
                          ),
                          Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 35,
                            color: ColorConstants.primary_green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Account',
                    iconData: IconConstants.person,
                    onTap: () {},
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Chats',
                    iconData: IconConstants.chat,
                    onTap: () {},
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Notifications',
                    iconData: IconConstants.notifications,
                    onTap: () {},
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Security',
                    iconData: IconConstants.security,
                    onTap: () {},
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Help',
                    iconData: IconConstants.help,
                    onTap: () {},
                  ),
                  Divider(thickness: 1),
                  ActionsContainer(
                    title: 'Logout',
                    iconData: IconConstants.logoutData,
                    onTap: () {},
                    backgroundColor: ColorConstants.light_red,
                    iconColor: ColorConstants.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
