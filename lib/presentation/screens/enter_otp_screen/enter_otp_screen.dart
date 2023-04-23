import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/presentation/screens/enter_otp_screen/bloc/enter_otp_bloc.dart';
import 'package:whats_app/presentation/widgets/login_button.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();

  bool hasError = false;
  String currentText = "";
  int count = 60;

  Future<void> startCounter() async {
    while (count != 0) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        count -= 1;
      });
    }
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    context.read<EnterOtpBloc>().add(StartTimerEvent(10));
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.light_background,
        title: Text(
          'Enter OTP code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: ColorConstants.primary_green),
      ),
      //!
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h, top: 100.h),
                  child: Text('Code has been send to entered phone number'),
                ),
                Form(
                  key: formKey,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    pastedTextStyle: TextStyle(
                      color: ColorConstants.primary_green,
                      fontWeight: FontWeight.bold,
                    ),
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (currentText.length < 6 || currentText == '123456') {
                        hasError = true;
                        return "Enter valid OTP";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      errorBorderColor: Colors.red,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.teal,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.teal,
                    ),
                    cursorColor: Colors.black,
                    enableActiveFill: true,
                    animationDuration: const Duration(milliseconds: 300),
                    errorAnimationController: errorController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                20.verticalSpace,
                BlocBuilder<EnterOtpBloc, EnterOtpState>(
                  builder: (context, state) {
                    if (state is EnterOtpInitial) {
                      // context.read<EnterOtpBloc>().add(StartTimerEvent(60));
                      return CupertinoActivityIndicator();
                    }
                    if (state is EnterOtpLoadedState) {
                      if (state.seconds == 0) {
                        return Text(
                          'resend Code?',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        );
                      }
                      return RichText(
                        text: TextSpan(
                          text: 'Resend Code in',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: ' ${state.seconds}',
                              style: TextStyle(
                                  color: ColorConstants.primary_green),
                            ),
                            TextSpan(text: ' s'),
                          ],
                        ),
                      );
                    } else {
                      return Text('Something went Wrong');
                    }
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginButton(
                  buttonText: 'Verify',
                  onPressed: () {
                    // BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                    //   email: state.email,
                    //   password: currentText,
                    // ));
                    /*if (state.status == AuthStatus.success) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      AlertDialog(
                        content: Row(
                          children: [
                            Text(
                              state.message,
                              softWrap: true,
                              maxLines: 1,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'OK',
                              ),
                            ),
                          ],
                        ),
                      );
                    }*/
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
