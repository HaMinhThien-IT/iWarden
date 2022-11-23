import 'package:iWarden/models/base_model.dart';

enum VehicleInformationType { FIRST_SEEN, GRACE_PERIOD }

class EvidencePhoto extends BaseModel {
  final int? VehicleInformationId;
  final String BlobName;

  const EvidencePhoto({
    int? Id,
    DateTime? Created,
    DateTime? Deleted,
    this.VehicleInformationId,
    required this.BlobName,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory EvidencePhoto.fromJson(Map<String, dynamic> json) =>
      _$EvidencePhotoFromJson(json);

  Map<String, dynamic> toJson() => _$EvidencePhotoToJson(this);
}

EvidencePhoto _$EvidencePhotoFromJson(Map<String, dynamic> json) =>
    EvidencePhoto(
      VehicleInformationId: json['VehicleInformationId'],
      BlobName: json['BlobName'],
      Id: json['Id'],
      Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
      Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
    );

Map<String, dynamic> _$EvidencePhotoToJson(EvidencePhoto instance) {
  return <String, dynamic>{
    'BlobName': instance.BlobName,
  };
}

class VehicleInformation extends BaseModel {
  final DateTime ExpiredAt;
  final String Plate;
  final int ZoneId;
  final int LocationId;
  final String BayNumber;
  final int Type;
  final num Latitude;
  final num Longitude;
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

  factory VehicleInformation.fromJson(Map<String, dynamic> json) =>
      _$VehicleInformationFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleInformationToJson(this);
}

VehicleInformation _$VehicleInformationFromJson(Map<String, dynamic> json) {
  var evidencePhotosFromJson = json['EvidencePhotos'] as List<dynamic>;
  List<EvidencePhoto> evidencePhotosList = evidencePhotosFromJson
      .map((model) => EvidencePhoto.fromJson(model))
      .toList();

  return VehicleInformation(
    Id: json['Id'],
    Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
    Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
    ExpiredAt: DateTime.parse(json['ExpiredAt']),
    Plate: json['Plate'],
    ZoneId: json['ZoneId'],
    LocationId: json['LocationId'],
    BayNumber: json['BayNumber'],
    Type: json['Type'],
    Latitude: json['Latitude'],
    Longitude: json['Longitude'],
    CarLeft: json['CarLeft'] as bool,
    EvidencePhotos: evidencePhotosList,
  );
}

Map<String, dynamic> _$VehicleInformationToJson(VehicleInformation instance) {
  final evidencePhotosToJson =
      instance.EvidencePhotos!.map((model) => model.toJson()).toList();

  return <String, dynamic>{
    'Id': instance.Id ?? 0,
    'ExpiredAt': instance.ExpiredAt.toIso8601String(),
    'Plate': instance.Plate,
    'ZoneId': instance.ZoneId,
    'LocationId': instance.LocationId,
    'BayNumber': instance.BayNumber,
    'Type': instance.Type,
    'Latitude': instance.Latitude,
    'Longitude': instance.Longitude,
    'CarLeft': instance.CarLeft,
    'EvidencePhotos': evidencePhotosToJson,
  };
}
