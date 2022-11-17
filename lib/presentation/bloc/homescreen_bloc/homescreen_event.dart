part of 'homescreen_bloc.dart';

abstract class HomescreenEvent extends Equatable {
  const HomescreenEvent();

  @override
  List<Object> get props => [];
}

class ChatsEvent extends HomescreenEvent {}
class StatusEvent extends HomescreenEvent {}
class CallsEvent extends HomescreenEvent {}
