import 'package:equatable/equatable.dart';

class WhatsUpUserEntity extends Equatable {
  final String email;
  WhatsUpUserEntity({required this.email});

  @override
  List<Object?> get props => [email];
}
