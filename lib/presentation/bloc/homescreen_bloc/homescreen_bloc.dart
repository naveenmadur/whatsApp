import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc()
      : super(HomescreenInitial(
            currentScreen: HomeScreenPages.chats,
            index: 1,
            call: false,
            chat: true,
            status: false)) {
    on<ChatsEvent>((event, emit) {
      emit(HomescreenInitial(
          currentScreen: HomeScreenPages.chats,
          index: 1,
          chat: true,
          call: false,
          status: false));
    });

    on<StatusEvent>((event, emit) {
      emit(HomescreenInitial(
          currentScreen: HomeScreenPages.status,
          index: 2,
          chat: false,
          call: false,
          status: true));
    });

    on<CallsEvent>((event, emit) {
      emit(HomescreenInitial(
          currentScreen: HomeScreenPages.calls,
          index: 3,
          chat: false,
          call: true,
          status: false));
    });
  }
}
