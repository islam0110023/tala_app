import 'package:flutter/material.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';

class MatchUserProvider extends InheritedWidget {
  const MatchUserProvider({
    super.key,
    required this.matchUser,
    required Widget child,
  }) : super(child: child);
  final MatchUserEntity? matchUser;
  static MatchUserEntity? of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<MatchUserProvider>();
    assert(provider != null, 'MatchUserProvider not found in context');
    return provider!.matchUser;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return matchUser != oldWidget.matchUser;
  }
}

extension on InheritedWidget {
  Object? get matchUser => null;
}
