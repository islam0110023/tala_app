import 'package:intl/intl.dart';

extension ChatTimeFormatter on DateTime {
  String toChatTime() {
    final now = DateTime.now();

    if (year == now.year && month == now.month && day == now.day) {
      return DateFormat('h:mm a').format(this); // 10:45 AM
    }

    if (year == now.year) {
      return DateFormat('dd/MM').format(this); // 13/08
    }

    return DateFormat('dd/MM/yyyy').format(this); // 13/08/2024
  }
}
