import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_app/data/model/user_model.dart';

abstract class UsersRemoteDataSource {
  Future<Stream<List<UserModel>>> fetchUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      
  @override
  Future<Stream<List<UserModel>>> fetchUsers() async {
    Stream<List<UserModel>> userStream = usersCollection.snapshots().map(
        (list) => list.docs
            .map(
                (doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList());

    return userStream;
  }
}
