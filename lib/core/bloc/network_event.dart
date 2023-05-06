part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  final bool isConnected;

  NetworkNotify({required this.isConnected});
}

class NetworkObserve extends NetworkEvent {}
