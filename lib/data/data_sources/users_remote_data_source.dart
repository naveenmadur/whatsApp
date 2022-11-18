import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UsersRemoteDataSource {
  Future<Stream<QuerySnapshot>?> fetchUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  @override
  Future<Stream<QuerySnapshot>?> fetchUsers() async {
    final Stream<QuerySnapshot> snapshot =  await usersCollection.snapshots();
    // for (int i = 0; i < await snapshot.length; i++) {
      // debugPrint(snapshot.docs[i].data().toString());
      // final data = UserModel.fromJson( snapshot.docs[i].data() as Map<String, dynamic>);
    //   await snapshot.forEach((element) {
    //     users.add(
    //         UserModel.fromJson(element.docs[i].data() as Map<String, dynamic>));
    //   });
    // }

    // debugPrint(users[1].email);
    return snapshot;
  }
}
