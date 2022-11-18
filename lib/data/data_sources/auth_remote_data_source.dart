import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app/data/model/auth/whatsup_user_model.dart';
import 'package:whats_app/domain/entities/auth/whatsup_user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> register(String phoneNumber, String userName);
  Future<void> login(String email, String password);
  Future<WhatsUpUserEntity> currentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //! Firebase Collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  //! Saving user data to firebase
  Future updateUserData({required String email, required String uid}) async {
    return await usersCollection.doc(uid).set({
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }

  //! Getting user data from firebase
  Future getUserData({required String email}) async {
    QuerySnapshot snapshot =
        await usersCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //! Register user
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

  //! Login
  @override
  Future<void> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value == true) {
          await getUserData(email: email);
        }
      });
    } on FirebaseException {
      return;
    } catch (e) {
      return;
    }
  }

  @override
  Future<WhatsUpUserEntity> currentUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
      QuerySnapshot snapshot =  await getUserData(email: user.email!);
      return WhatsupUserModel(email: snapshot.docs[0]["email"]);
  }
}
