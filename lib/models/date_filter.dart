class DateFilter {
  final String label;
  final String value;
  DateFilter({required this.label, required this.value});
}

class DataDateFilter {
  List<DateFilter> data = [
    DateFilter(label: "Today", value: '1'),
    DateFilter(label: "Yesterday", value: '2'),
    DateFilter(label: "This week", value: '3'),
    DateFilter(label: "Last week", value: '4'),
    DateFilter(label: "This month", value: '5'),
    DateFilter(label: "This month 2", value: '6'),
  ];
}
