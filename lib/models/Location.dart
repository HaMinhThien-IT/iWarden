class Location {
  String label;
  String value;

  Location({required this.label, required this.value});
}

class LocationList {
  final List<Location> locations = [
    Location(label: 'New York', value: 'New York'),
    Location(label: 'London', value: 'London'),
    Location(label: 'HaNoi', value: 'HaNoi'),
    Location(label: 'Tokyo', value: 'Tokyo')
  ];
}
