import 'package:whats_app/domain/entities/entities.dart';

class WhatsupUserModel extends WhatsUpUserEntity {
  WhatsupUserModel({required super.email, super.uid});

  @override
  List<Object?> get props => [email, uid];
}
