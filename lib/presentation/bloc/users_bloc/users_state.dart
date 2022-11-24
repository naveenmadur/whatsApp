// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class AllUsers extends UsersState {
  final Stream<List<UserEntity>> userStream;
  AllUsers({required this.userStream});
}

class ErrorState extends UsersState {
  final String? message;

  ErrorState({this.message});
}
