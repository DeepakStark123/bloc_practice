// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetSateteCubit { initialSate, lost, gained }

class InternetCubit extends Cubit<InternetSateteCubit> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  InternetCubit() : super(InternetSateteCubit.initialSate) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetSateteCubit.gained);
      } else {
        emit(InternetSateteCubit.lost);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
