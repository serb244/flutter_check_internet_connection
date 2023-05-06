part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  final bool isConnected;

  NetworkNotify({this.isConnected = false});
}

class NetworkObserve extends NetworkEvent {}
