import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class FormatDate {
  formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(':');
  }

  //3 minutes ago
  timeAgo(DateTime date) {
    return timeago.format(date);
  }

  //06/09/2022 08:55 AM
  getLocalDate(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  getLocalDate2(DateTime date) {
    return DateFormat('HH:mm:ss dd/MM/yyyy').format(date);
  }

  startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 00, 00, 000, 000);
  }

  endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 000, 000);
  }

  startOfWeek() {
    return startOfDay(
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)));
  }

  endOfWeek() {
    return endOfDay(DateTime.now()
        .add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)));
  }

  startOfMonth() {
    return DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  }

  endOfMonth() {
    return endOfDay(DateTime.utc(
      DateTime.now().year,
      DateTime.now().month + 1,
    ).subtract(const Duration(days: 1)));
  }

  startLastWeek() {
    return startOfDay(
        DateTime.now().subtract(Duration(days: DateTime.now().weekday + 6)));
  }

  endLastWeek() {
    return endOfDay(
        DateTime.now().subtract(Duration(days: DateTime.now().weekday)));
  }
}

final formatDate = FormatDate();
