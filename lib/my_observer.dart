import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log('🆕 CREATED', bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log('🟢 EVENT', bloc, details: event.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _log(
      '🔄 CHANGE',
      bloc,
      details:
          'From: ${change.currentState.runtimeType}\nTo:   ${change.nextState.runtimeType}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _log(
      '🔁 TRANSITION',
      bloc,
      details:
          'Event: ${transition.event.runtimeType}\nFrom: ${transition.currentState.runtimeType}\nTo:   ${transition.nextState.runtimeType}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _log('❌ ERROR', bloc, details: '$error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    _log('🔒 CLOSED', bloc);
    super.onClose(bloc);
  }

  void _log(String type, BlocBase bloc, {String? details}) {
    if (kReleaseMode) return; // Disable logs in release mode

    final message =
        '''
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
$type => ${bloc.runtimeType}
${details ?? ""}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
''';
    log(message, name: 'BLoC Observer');
  }
}
