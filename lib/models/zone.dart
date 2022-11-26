import 'package:iWarden/models/base_model.dart';
import 'package:iWarden/models/service.dart';

class Zone extends BaseModel {
  final int LocationId;
  final String Name;
  final String PublicName;
  final List<Service>? Services;
  final String ExternalReference;

  const Zone({
    Id,
    Created,
    Deleted,
    required this.LocationId,
    required this.Name,
    required this.PublicName,
    this.Services,
    required this.ExternalReference,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  var servicesFromJson = json['Services'] as List<dynamic>;
  List<Service> servicesList =
      servicesFromJson.map((model) => Service.fromJson(model)).toList();

  return Zone(
    Id: json['Id'],
    Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
    Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
    LocationId: json['LocationId'],
    Name: json['Name'],
    PublicName: json['PublicName'],
    Services: servicesList,
    ExternalReference: json['ExternalReference'],
  );
}
