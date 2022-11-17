// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/screens/home_screen/home_screen.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/email_id_container.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/phone_number_text_span.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/remember_me_row.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/sign_up_row.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/password_container.dart';
import 'package:whats_app/presentation/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  bool hasError = false;
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.light_background,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is CurrentState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(
                        'lib/assets/images/splash_light.png',
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Text(
                            'Sign in to your account',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PhoneNumberTextSpan(),
                        EmailIdContainer(
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordContainer(onChanged: (value) {
                          _password = value;
                        }),
                        state.status == AuthStatus.failure
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorConstants.light_red,
                                  ),
                                  child: Text(
                                    state.message,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            : Text(''),
                        RememberMeRow(),
                        LoginButton(
                          buttonText: 'Log in',
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(email: _email, password: _password));
                            if (!hasError) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            }
                          },
                        ),
                        SignUpRow(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is AuthInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorConstants.primary_green,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: ColorConstants.primary_green,
              ),
            );
          }
        },
      ),
    );
  }
}
