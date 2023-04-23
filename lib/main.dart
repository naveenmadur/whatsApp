import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whats_app/core/di/injector.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/bloc/homescreen_bloc/homescreen_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:whats_app/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:whats_app/presentation/bloc/users_bloc/users_bloc.dart';
import 'package:whats_app/presentation/screens/enter_otp_screen/bloc/enter_otp_bloc.dart';
import 'package:whats_app/presentation/screens/handle_auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => kiwi.KiwiContainer().resolve<AuthBloc>(),
        ),
        BlocProvider<HomescreenBloc>(
          create: (context) => HomescreenBloc(),
        ),
        BlocProvider<UsersBloc>(
          create: (context) => kiwi.KiwiContainer().resolve<UsersBloc>(),
        ),
        BlocProvider<MessageBloc>(
          create: (context) => kiwi.KiwiContainer().resolve<MessageBloc>(),
        ),
        BlocProvider(
          create: (context) => kiwi.KiwiContainer().resolve<EnterOtpBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return FirebasePhoneAuthProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.grey[100],
                primarySwatch: Colors.teal,
                useMaterial3: true,
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 15.h,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                  prefixIconColor: Colors.teal,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.teal),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              home: HandleAuthScreen(),
              // home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
