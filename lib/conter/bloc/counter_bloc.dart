// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/conter/bloc/counter_event.dart';
import 'package:test_app/conter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitialState(0)) {
    on<CounterIncrementEvent>((event, emit) {
      counter++;
      emit(CounterIncrementState(counter));
    });
    on<CounterDecrementEvent>((event, emit) {
      counter--;
      emit(CounterDecrementState(counter));
    });
  }
}
