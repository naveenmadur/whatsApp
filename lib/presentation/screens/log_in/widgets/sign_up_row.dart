import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_constants.dart';
import 'package:whats_app/presentation/screens/sign_up/signup_screen.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextConstants.dontHaveAnAccount,
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: ColorConstants.primary_green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneAuthRow extends StatelessWidget {
  const PhoneAuthRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
