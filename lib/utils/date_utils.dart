import 'package:intl/intl.dart';

class DateTimeUtils {
  static String? formatDateFrom(int? timestamp) {
    if (timestamp == null) return '';
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
    String formattedDate = DateFormat.yMMMMEEEEd().format(date.toLocal());
    return formattedDate;
  }

  static String formatToHour(int? timestamp) {
    if (timestamp == null) return '';
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);

    String formattedDate = DateFormat('HH:mm').format(date.toLocal());
    return formattedDate;
  }
}
