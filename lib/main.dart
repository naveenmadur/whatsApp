import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whats_app/core/di/injector.dart';
import 'package:whats_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:whats_app/presentation/bloc/homescreen_bloc/homescreen_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:whats_app/presentation/screens/home_screen/home_screen.dart';
import 'package:whats_app/presentation/screens/log_in/login_screen.dart';
import 'package:whats_app/presentation/screens/sign_up/signup_screen.dart';

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
        BlocProvider<HomescreenBloc>(create: (context) => HomescreenBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            // home: LoginScreen(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
