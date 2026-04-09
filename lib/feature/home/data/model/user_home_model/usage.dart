import 'package:cloud_firestore/cloud_firestore.dart';

class Usage {

  Usage({this.date, this.messagesUsed, this.scrollsUsed});

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    date: (json['date'] as Timestamp?)?.toDate(),
    messagesUsed: json['messagesUsed'] as int?,
    scrollsUsed: json['scrollsUsed'] as int?,
  );
  DateTime? date;
  int? messagesUsed;
  int? scrollsUsed;

  Map<String, dynamic> toJson() => {
    'date': date,
    'messagesUsed': messagesUsed,
    'scrollsUsed': scrollsUsed,
  };
}
