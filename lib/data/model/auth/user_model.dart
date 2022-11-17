import 'package:whats_app/domain/entities/entities.dart';

class UserModel extends WhatsUpUser {
  UserModel({required super.email});

  @override
  List<Object?> get props => [email];
}
