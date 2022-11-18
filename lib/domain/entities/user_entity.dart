// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String profilePic;
  final String uid;
  UserEntity({
    required this.email,
    required this.profilePic,
    required this.uid,
  });

  @override
  List<Object?> get props => [email, profilePic, uid];
}
