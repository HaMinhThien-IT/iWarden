class DateFilter {
  final String key;
  final DateTime value;
  DateFilter({required this.key, required this.value});
}

class DataDateFilter {
  List<DateFilter> data = [
    DateFilter(key: "Today", value: DateTime.now()),
    DateFilter(key: "Yesterday", value: DateTime.now()),
    DateFilter(key: "This week", value: DateTime.now()),
    DateFilter(key: "Last week", value: DateTime.now()),
    DateFilter(key: "This month", value: DateTime.now()),
  ];
}
