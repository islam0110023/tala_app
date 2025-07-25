import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetService {
  InternetService() {
    _init();
  }
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  bool _isConnected = true;

  bool get isConnected => _isConnected;
  Stream<bool> get onStatusChanged => _controller.stream;

  void _init() async {
    _checkInitialConnection();
    Connectivity().onConnectivityChanged.listen((_) => _checkConnection());
  }

  Future<void> _checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _setConnection(false);
    } else {
      final hasInternet =
          await InternetConnectionChecker.instance.hasConnection;
      _setConnection(hasInternet);
    }
  }

  void _checkConnection() async {
    final hasInternet = await InternetConnectionChecker.instance.hasConnection;
    _setConnection(hasInternet);
  }

  void _setConnection(bool status) {
    if (_isConnected != status) {
      _isConnected = status;
      _controller.add(status);
    }
  }

  void dispose() => _controller.close();
}
