import 'package:iWarden/helpers/format_date.dart';

class DateFilter {
  final String label;
  final String value;
  DateFilter({required this.label, required this.value});
}

class DataFilerProps {
  DateTime? from;
  DateTime? to;
  DataFilerProps({required this.to, required this.from});
  dynamic toJson() => {
        'from': from,
        'to': to,
      };
  DataFilerProps.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }
  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = from;
    data['to'] = to;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class DataDateFilter {
  List<DateFilter> data = [
    DateFilter(
        label: "Today",
        value: DataFilerProps(
                from: formatDate.startOfDay(DateTime.now()),
                to: formatDate.endOfDay(DateTime.now()))
            .toString()),
    DateFilter(
        label: "Yesterday",
        value: DataFilerProps(
                from: formatDate.startOfDay(
                    DateTime.now().subtract(const Duration(days: 1))),
                to: formatDate
                    .endOfDay(DateTime.now().subtract(const Duration(days: 1))))
            .toString()),
    DateFilter(
        label: "This week",
        value: DataFilerProps(
                from: formatDate.startOfWeek(), to: formatDate.endOfWeek())
            .toString()),
    DateFilter(
        label: "Last week",
        value: DataFilerProps(
                from: formatDate.startLastWeek(), to: formatDate.endLastWeek())
            .toString()),
    DateFilter(
        label: "This month",
        value: DataFilerProps(
                from: formatDate.startOfMonth(), to: formatDate.endOfMonth())
            .toString()),
  ];
}
