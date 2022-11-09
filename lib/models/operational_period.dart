import 'package:iWarden/models/base_model.dart';

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
}
