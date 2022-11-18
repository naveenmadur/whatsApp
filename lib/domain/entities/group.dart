// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:whats_app/domain/entities/auth/whatsup_user_entity.dart';

class Group extends Equatable {
  final String groupName;
  final String groupImage;
  final List<WhatsUpUserEntity> users;
  Group({
    required this.groupName,
    required this.groupImage,
    required this.users,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
