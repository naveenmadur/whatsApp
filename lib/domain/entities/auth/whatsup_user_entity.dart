// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WhatsUpUserEntity extends Equatable {
  final String email;
  final String? uid;
  WhatsUpUserEntity({
    required this.email,
    this.uid,
  });

  @override
  List<Object?> get props => [email];
}
