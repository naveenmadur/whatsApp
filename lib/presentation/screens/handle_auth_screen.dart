import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/presentation/screens/home_screen/home_screen.dart';
import 'package:whats_app/presentation/screens/log_in/login_screen.dart';

class HandleAuthScreen extends StatelessWidget {
  const HandleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
