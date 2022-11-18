import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/use_case/get_all_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  UsersBloc({required this.getAllUsersUseCase}) : super(UsersInitial()) {
    on<GetAllUsers>((event, emit) async {
      final result = await getAllUsersUseCase.getAllUsers();
      result.fold((l) {
        emit(ErrorState());
      }, (r) {
        emit(AllUsers(snapshot: r));
      });
    });
  }
}
