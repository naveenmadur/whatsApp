import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/paddings&margins.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.light_green,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_vert_rounded,
            color: ColorConstants.primary_green,
          ),
        ),
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
