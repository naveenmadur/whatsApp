import 'package:equatable/equatable.dart';

class WhatsUpUser extends Equatable {
  final String email;
  WhatsUpUser({required this.email});

  @override
  List<Object?> get props => [email];
}
