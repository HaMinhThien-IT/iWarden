import 'package:iWarden/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OperationalPeriod extends BaseModel {
  final int Weekday;
  final int RequireWarden;
  final int TimeFrom;
  final int TimeTo;
  final int LocationId;

  const OperationalPeriod({
    Id,
    Created,
    Deleted,
    required this.Weekday,
    required this.RequireWarden,
    required this.TimeFrom,
    required this.TimeTo,
    required this.LocationId,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory OperationalPeriod.fromJson(Map<String, dynamic> json) =>
      _$OperationalPeriodFromJson(json);
}

OperationalPeriod _$OperationalPeriodFromJson(Map<String, dynamic> json) =>
    OperationalPeriod(
      Id: json['Id'],
      Created: json['Created'],
      Deleted: json['Deleted'],
      Weekday: json['Weekday'],
      RequireWarden: json['RequireWarden'],
      TimeFrom: json['TimeFrom'],
      TimeTo: json['TimeTo'],
      LocationId: json['LocationId'],
    );
