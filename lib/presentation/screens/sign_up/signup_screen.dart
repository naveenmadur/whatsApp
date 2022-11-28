import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/screens/home_screen/home_screen.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/email_id_container.dart';
import 'package:whats_app/presentation/widgets/required_text_span.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/remember_me_row.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/password_container.dart';
import 'package:whats_app/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:whats_app/presentation/widgets/login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _emailId = "";
  bool hasError = false;
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.light_background,
      //!
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
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
                        RequiredTextSpan(
                          title: 'Email Address',
                        ),
                        EmailIdContainer(
                          onChanged: (value) {
                            _emailId = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordContainer(
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                        RememberMeRow(),
                        LoginButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    email: _emailId, password: _password));
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => HomeScreen(),
                            //   ),
                            // );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LoadingState) {
            return CustomCircularProgressIndicator();
          } else if (state is ErrorState) {
            return AlertDialog(
              title: Text(state.message),
              backgroundColor: ColorConstants.light_red,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      _password = "";
                      BlocProvider.of<AuthBloc>(context).add(InitialEvent());
                    },
                    child: Text('OK'))
              ],
            );
          } else {
            return CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }
}
