import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class FormatDate {
  //3 minutes ago
  timeAgo(DateTime date) {
    return timeago.format(date);
  }

  //06/09/2022 08:55 AM
  getLocalDate(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  //Visited: 12:12:23 12/08/2022
  // getLocalDate2(DateTime date) {
  //   return DateFormat.Hm().addPattern('dd/MM/yyyy').format(date);
  // }

  // getLocalTime(DateTime date) {
  //   return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  // }
}
