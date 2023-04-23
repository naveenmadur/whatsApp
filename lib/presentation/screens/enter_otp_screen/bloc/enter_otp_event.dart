part of 'enter_otp_bloc.dart';

@immutable
abstract class EnterOtpEvent extends Equatable {
  const EnterOtpEvent();
}

class StartTimerEvent extends EnterOtpEvent {
  final int seconds;
  const StartTimerEvent(this.seconds);
  @override
  List<Object?> get props => [seconds];
}
