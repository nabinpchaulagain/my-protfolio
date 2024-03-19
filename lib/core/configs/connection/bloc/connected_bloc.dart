// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywebsite/core/configs/connection/bloc/connected_event.dart';
import 'package:mywebsite/core/configs/connection/bloc/connected_state.dart';

class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;
  ConnectedBloc() : super(ConnectedInitialState()) {
    on<ConnectedEvent>((event, emit) => emit(ConnectedSucessState()));
    on<OnNotConnectedEvents>((event, emit) => emit(ConnectedFailureState()));

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(OnConnectedEvent());
      } else {
        add(OnNotConnectedEvents());
      }
    });
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
