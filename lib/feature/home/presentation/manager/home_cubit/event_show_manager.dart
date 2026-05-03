import 'package:flutter/material.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';

class EventShowManager extends InheritedWidget {

  const EventShowManager({
    super.key,
    required this.event,
    required this.isFav,
    required super.child,
  });
  final EventModel event;
  final bool isFav;

  static EventShowManager of(BuildContext context) {
    final result =
    context.dependOnInheritedWidgetOfExactType<EventShowManager>();

    assert(result != null, 'No EventShowManager found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant EventShowManager oldWidget) {
    return event != oldWidget.event || isFav != oldWidget.isFav;
  }
}