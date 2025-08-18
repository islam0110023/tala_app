import 'package:flutter/material.dart';

class GetMessagesParam {
  GetMessagesParam(this.context, {required this.chatId});

  final String chatId;
  final BuildContext context;
}