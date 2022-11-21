import 'package:iWarden/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Zone extends BaseModel {
  final int LocationId;
  final String Name;
  final String PublicName;

  const Zone({
    Id,
    Created,
    Deleted,
    required this.LocationId,
    required this.Name,
    required this.PublicName,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}

Zone _$ZoneFromJson(Map<String, dynamic> json) => Zone(
      Id: json['Id'],
      Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
      Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
      LocationId: json['LocationId'],
      Name: json['Name'],
      PublicName: json['PublicName'],
    );
