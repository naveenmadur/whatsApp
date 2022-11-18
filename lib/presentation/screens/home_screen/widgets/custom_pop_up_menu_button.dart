import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.light_green,
        ),
        child: Icon(
          Icons.more_vert,
          color: ColorConstants.primary_green,
        ),
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.person_outline,
              color: ColorConstants.primary_green,
            ),
            title: const Text('Profile'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: ColorConstants.red,
            ),
            title: const Text('Logout'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
        const PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
      ],
    );
  }
}
