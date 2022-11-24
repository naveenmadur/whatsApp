import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  Future<String> getCurrentUser() async {
    final currentUserId = await FirebaseAuth.instance.currentUser!.uid;
    return currentUserId;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text('All Status will appear here'),
      ),
    );
  }
}
