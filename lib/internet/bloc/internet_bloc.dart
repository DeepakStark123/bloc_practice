// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_app/internet/bloc/internet_event.dart';
import 'package:test_app/internet/bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscribtion;
  InternetBloc() : super(InternetinitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLossState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    _connectivitySubscribtion =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscribtion?.cancel();
    return super.close();
  }
}
