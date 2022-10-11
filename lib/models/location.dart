class Location {
  String id;
  String label;
  String value;

  Location({required this.id, required this.label, required this.value});

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        label = json['label'],
        value = json['value'];
}
