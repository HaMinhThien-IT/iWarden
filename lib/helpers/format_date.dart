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
}
