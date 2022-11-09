import 'package:iWarden/models/base_model.dart';

abstract class VehicleInformationType {
  static int FIRST_SEEN = 0;
  static int GRACE_PERIOD = 1;
}

class EvidencePhoto {
  final int VehicleInformationId;
  final String BlobName;

  const EvidencePhoto({
    required this.VehicleInformationId,
    required this.BlobName,
  });
}

class VehicleInformation extends BaseModel {
  final DateTime ExpiredAt;
  final String Plate;
  final int ZoneId;
  final int LocationId;
  final String BayNumber;
  final VehicleInformationType Type;
  final int Latitude;
  final int Longitude;
  final bool CarLeft;
  final List<EvidencePhoto>? EvidencePhotos;

  const VehicleInformation({
    Id,
    Created,
    Deleted,
    required this.ExpiredAt,
    required this.Plate,
    required this.ZoneId,
    required this.LocationId,
    required this.BayNumber,
    required this.Type,
    required this.Latitude,
    required this.Longitude,
    required this.CarLeft,
    this.EvidencePhotos,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);
}
