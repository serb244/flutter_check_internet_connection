import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_check_internet_connection/core/bloc/network_bloc.dart';

class CheckConnection {
  static final Connectivity connectivity = Connectivity();
  static void init() async {
    var connectivityResult = await connectivity.checkConnectivity();
    bool isConnected = connectivityResult != ConnectivityResult.none;
    setDataToBloc(isConnected);
    updateConnectionStatus();
  }

  static void updateConnectionStatus() {
    connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      bool isConnected = connectivityResult != ConnectivityResult.none;
      setDataToBloc(isConnected);
    });
  }

  static void setDataToBloc(bool isConnected) {
    NetworkBloc().add(NetworkNotify(isConnected: isConnected));
  }
}
