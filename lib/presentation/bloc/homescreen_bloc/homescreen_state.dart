// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'homescreen_bloc.dart';

enum HomeScreenPages {chats, status, calls}

abstract class HomescreenState extends Equatable {
  const HomescreenState();

  @override
  List<Object> get props => [];
}

class HomescreenInitial extends HomescreenState {
  final HomeScreenPages currentScreen;
  final int index;
  final bool chat,status,call;
  HomescreenInitial({
    required this.currentScreen,
    required this.index,
    required this.chat,
    required this.status,
    required this.call,
  });

  @override
  List<Object> get props => [currentScreen];
}
