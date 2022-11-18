// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:whats_app/domain/entities/auth/whatsup_user_entity.dart';
import 'package:whats_app/domain/use_case/authentication/get_currentUser_usercase.dart';
import 'package:whats_app/domain/use_case/authentication/sign_up_usecase.dart';
import 'package:whats_app/domain/use_case/authentication/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  String phoneNumber = '';
  String verificationId = '';
  AuthBloc({
    required this.signupUseCase,
    required this.loginUseCase,
    required this.getCurrentUserUseCase,
  }) : super(CurrentState(
            status: AuthStatus.success, message: 'Initial', email: '')) {
    on<RegisterEvent>((event, emit) async {
      final result = await signupUseCase.registerUser(
          email: event.email, password: event.password);
      phoneNumber = event.email;
      result.fold((l) {
        emit(
          CurrentState(
            status: AuthStatus.failure,
            message: l.message,
            email: event.email,
          ),
        );
      }, (r) {
        emit(
          CurrentState(
            status: AuthStatus.success,
            message: 'Registration Successful',
            email: r.email,
          ),
        );
      });
    });

    on<LoginEvent>((event, emit) async {
      final result = await loginUseCase.login(
        email: event.email,
        password: event.password,
      );

      result.fold((l) {
        CurrentState(
          status: AuthStatus.failure,
          message: l.message,
          email: event.email,
        );
      }, (r) {
        CurrentState(
          status: AuthStatus.success,
          message: 'Login Successful',
          email: r.email,
        );
      });
    });

    on<GetCurrentUser>((event, emit) async {
      final user = await getCurrentUserUseCase.currentUser();
      user.fold((l) => null, (r) => emit(UserDetails(user: r)));
    });
  }
}
