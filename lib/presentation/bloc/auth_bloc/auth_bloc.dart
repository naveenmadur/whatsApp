// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:whats_app/domain/use_case/authentication/sign_up_usecase.dart';
import 'package:whats_app/domain/use_case/authentication/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase signupUseCase;
  final LoginUseCase validateOtpUseCase;
  String phoneNumber = '';
  String verificationId = '';
  AuthBloc({
    required this.signupUseCase,
    required this.validateOtpUseCase,
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
            email: phoneNumber,
          ),
        );
      }, (r) {
        emit(
          CurrentState(
            status: AuthStatus.success,
            message: 'Registration Successful',
            email: phoneNumber,
          ),
        );
      });
    });

    on<LoginEvent>((event, emit) async {
      final result = await validateOtpUseCase.login(
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
          email: event.email,
        );
      });
    });
  }
}
