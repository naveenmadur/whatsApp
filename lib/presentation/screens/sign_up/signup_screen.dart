import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/presentation/screens/enter_otp_screen/enter_otp_screen.dart';
import 'package:whats_app/presentation/widgets/login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '+91';
  String _tempPhoneNumber = '';
  String _name = '';

  @override
  Widget build(BuildContext context) {
    print(_phoneNumber);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Sign up'),
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
      ),
      //!
      // body: SignupScreenBody(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_android_rounded,
                      ),
                      counterText: '',
                      hintText: 'Phone Number',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: (value) {
                      if (value?.length == 10) {
                        return null;
                      } else {
                        return 'Enter valid mobile number';
                      }
                    },
                    onChanged: (value) {
                      _tempPhoneNumber = value;
                    },
                  ),
                  30.verticalSpace,
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                      ),
                      counterText: '',
                      hintText: 'What should we call you?',
                    ),
                    validator: (value) {
                      if (value?.length == 0) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    maxLength: 10,
                  ),
                ],
              ),
            ),
            30.verticalSpace,
            StatefulBuilder(
              builder: (context, setState) {
                return LoginButton(
                  buttonText: 'Send OTP',
                  onPressed: () {
                    // BlocProvider.of<AuthBloc>(context).add(
                    //   RegisterEvent(email: _emailId, password: _password),
                    // );
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EnterOtpScreen(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthHandler(
      phoneNumber: "+918888597565",
      builder: (context, controller) {
        return SizedBox.shrink();
      },
    );
  }
}
