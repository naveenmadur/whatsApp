import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/presentation/widgets/login_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Image(
            image: AssetImage(
              'lib/assets/images/splash_light.png',
            ),
          ),
          Text(
            'The best chat app of this century',
            style: TextStyle(fontSize: 20.sp),
          ),
          LoginButton(
            buttonText: 'Continue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
