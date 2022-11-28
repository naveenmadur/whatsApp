import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/decorations.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/paddings&margins.dart';
import 'package:whats_app/presentation/screens/settings/settings_screen.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Container(
        padding: Paddings.appBarIconPadding,
        margin: Margins.appBarIconMargin,
        decoration: Decorations.appBarIconBoxDecoration,
        child: IconConstants.more,
      ),
      iconSize: 10,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      offset: Offset(-20, 50),
      color: ColorConstants.light_red,
      splashRadius: 20,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: IconConstants.settings,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
            title: const Text('Settings'),
            contentPadding: Paddings.popUpMenuItemContentPadding,
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: IconConstants.logout,
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            title: const Text('Logout'),
            contentPadding: Paddings.popUpMenuItemContentPadding,
          ),
        ),
      ],
    );
  }
}
