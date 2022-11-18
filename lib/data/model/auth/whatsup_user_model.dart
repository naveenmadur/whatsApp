import 'package:whats_app/domain/entities/entities.dart';

class WhatsupUserModel extends WhatsUpUserEntity {
  WhatsupUserModel({required super.email});

  @override
  List<Object?> get props => [email];
}
