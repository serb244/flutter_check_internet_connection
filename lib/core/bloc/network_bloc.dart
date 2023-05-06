import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/check_connection.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkState(isConnected: true)) {
    on<NetworkNotify>(_checkInternetStatus);
    on<NetworkObserve>(_observe);
  }
  void _checkInternetStatus(event, emit) {
    log('event.isConnected = ${event.isConnected}');
    emit(NetworkState(isConnected: event.isConnected));
  }

  void _observe(event, emit) {
    CheckConnection.init();
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;
}
