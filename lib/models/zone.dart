import 'package:iWarden/models/base_model.dart';

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
}
