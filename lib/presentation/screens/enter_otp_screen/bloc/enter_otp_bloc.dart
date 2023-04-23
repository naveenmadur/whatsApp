import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'enter_otp_event.dart';
part 'enter_otp_state.dart';

class EnterOtpBloc extends Bloc<EnterOtpEvent, EnterOtpState> {
  EnterOtpBloc() : super(EnterOtpInitial()) {
    on<StartTimerEvent>((event, emit) async {
      int seconds = event.seconds;

      while (seconds > 0) {
        await Future.delayed(Duration(seconds: 1));
        seconds -= 1;
        emit(EnterOtpLoadedState(seconds: seconds));
      }
    });
  }
}
