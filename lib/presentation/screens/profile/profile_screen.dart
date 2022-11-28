import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/text_styles.dart';
import 'package:whats_app/presentation/screens/profile/widgets/editing_container.dart';
import 'package:whats_app/presentation/widgets/app_bar_actions_container.dart';
import 'package:whats_app/presentation/widgets/required_text_span.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      appBar: AppBar(
        leading: IconConstants.appBarLeadingIcon(onTap: () {
          Navigator.of(context).pop();
        }),
        title: Text(
          'Profile',
          style: TextStyles.homescreenAppBarTextStyle,
        ),
        backgroundColor: ColorConstants.light_background,
        actions: [
          AppBarAcionsContainer(icon: Icons.edit, ontap: () {}),
          AppBarAcionsContainer(icon: Icons.more_vert, ontap: () {}),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: ColorConstants.light_green,
              ),
            ),
            Divider(thickness: 1),
            RequiredTextSpan(title: 'Name'),
            EditingContainer(hintText: 'Name'),
            SizedBox(height: 10),
            RequiredTextSpan(title: 'About'),
            EditingContainer(hintText: 'About'),
            SizedBox(height: 10),
            RequiredTextSpan(title: 'Email Address'),
            EditingContainer(hintText: 'Email Address'),
          ],
        ),
      ),
    );
  }
}
