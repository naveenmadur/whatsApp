import 'package:whats_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.profilePic,
    required super.uid,
  });

  @override
  List<Object?> get props => [email, profilePic, uid];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      profilePic: json['profilePic'],
      uid: json['uid'],
    );
  }
}
