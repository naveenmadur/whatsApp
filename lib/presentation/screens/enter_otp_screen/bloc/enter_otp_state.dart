part of 'enter_otp_bloc.dart';

@immutable
abstract class EnterOtpState extends Equatable {
  const EnterOtpState();
}

class EnterOtpInitial extends EnterOtpState {
  @override
  List<Object?> get props => [];
}

class EnterOtpLoadedState extends EnterOtpState {
  final int seconds;

  const EnterOtpLoadedState({required this.seconds});
  @override
  List<Object?> get props => [seconds];
}
