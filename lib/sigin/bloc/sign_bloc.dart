// ignore_for_file: depend_on_referenced_packages

import 'package:email_validator/email_validator.dart';
import 'package:test_app/sigin/bloc/signin_event.dart';
import 'package:test_app/sigin/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigInBloc extends Bloc<SignInEvent, SignInState> {
  SigInBloc() : super(SignInInitialState()) {
    on<SigInTextChangeEvent>((event, emit) {
      if (event.emailValue == "" ||
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter valid email addresss"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SigInSubmitedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
