import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class PresenceService with WidgetsBindingObserver {
  PresenceService._();

  static final PresenceService instance = PresenceService._();

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance;

  DatabaseReference? _statusRef;
  StreamSubscription<DatabaseEvent>? _connectedSub;

  Future<void> start() async {
    final user = _auth.currentUser;
    if (user == null) return;

    WidgetsBinding.instance.addObserver(this);

    _statusRef = _db.ref('status/${user.uid}');

    final connectedRef = _db.ref('.info/connected');

    _connectedSub?.cancel();
    _connectedSub = connectedRef.onValue.listen((event) async {
      final isConnected = event.snapshot.value as bool? ?? false;
      if (!isConnected) return;

      await _statusRef!.onDisconnect().set({
        'state': 'offline',
        'lastChanged': ServerValue.timestamp,
      });

      await _setOnline();
    });
  }

  Future<void> stop() async {
    await _connectedSub?.cancel();
    _connectedSub = null;

    WidgetsBinding.instance.removeObserver(this);
    if (_statusRef != null && _auth.currentUser != null) {
      await _setOffline();
      await _statusRef!.onDisconnect().cancel();
    }
    _statusRef = null;
  }

  Future<void> _setOnline() async {
    if (_statusRef == null || _auth.currentUser == null) return;

    await _statusRef!.set({
      'state': 'online',
      'lastChanged': ServerValue.timestamp,
    });
  }

  Future<void> _setOffline() async {
    if (_statusRef == null || _auth.currentUser == null) return;

    await _statusRef!.set({
      'state': 'offline',
      'lastChanged': ServerValue.timestamp,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _setOnline();
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _setOffline();
        break;

      case AppLifecycleState.hidden:
        _setOffline();
        break;
    }
  }
}
