import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/decorations.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/paddings&margins.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      offset: Offset(-20, 50),
      color: ColorConstants.light_red,
      splashRadius: 20,
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.person_outline,
              color: ColorConstants.primary_green,
            ),
            title: const Text('Profile'),
            contentPadding: Paddings.popUpMenuItemPadding,
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: ColorConstants.red,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            title: const Text('Logout'),
            contentPadding: Paddings.popUpMenuItemPadding,
          ),
        ),
      ],
    );
  }
}
