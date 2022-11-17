import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/core/errors/failure.dart';

abstract class AuthRemoteDataSource {
  Future<void> register(String phoneNumber, String userName);
  Future<void> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//! Firebase Collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  Future updateUserData({required String email, required String uid}) async {
    return await usersCollection.doc(uid).set({
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }

  @override
  Future<void> register(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await updateUserData(email: email, uid: user.uid);
      }
    } on FirebaseException {
      return;
    } catch (e) {
      return;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException {
      return;
    } catch (e) {
      return;
    }
  }
}
