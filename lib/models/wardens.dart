import 'package:iWarden/models/base_model.dart';

class Wardens extends BaseModel {
  final String ExternalId;
  final int CountrySubRegionId;
  final String FistName;
  final String LastName;
  final String Email;
  final String PhoneNumber;
  final String Postcode;
  final String Picture;
  final String IWardenNumber;
  final int ContractHours;
  final DateTime StartDate;
  final num Latitude;
  final num Longitude;

  const Wardens({
    Id,
    Created,
    Deleted,
    required this.ExternalId,
    required this.CountrySubRegionId,
    required this.FistName,
    required this.LastName,
    required this.Email,
    required this.PhoneNumber,
    required this.Postcode,
    required this.Picture,
    required this.IWardenNumber,
    required this.ContractHours,
    required this.StartDate,
    required this.Latitude,
    required this.Longitude,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory Wardens.fromJson(Map<String, dynamic> json) =>
      _$WardensFromJson(json);
}

Wardens _$WardensFromJson(Map<String, dynamic> json) => Wardens(
      Id: json['Id'],
      Created: json['Created'],
      Deleted: json['Deleted'],
      ExternalId: json['ExternalId'],
      CountrySubRegionId: json['CountrySubRegionId'],
      FistName: json['FistName'],
      LastName: json['LastName'],
      Email: json['Email'],
      PhoneNumber: json['PhoneNumber'],
      Postcode: json['Postcode'],
      Picture: json['Picture'],
      IWardenNumber: json['IWardenNumber'],
      ContractHours: json['ContractHours'],
      StartDate: json['StartDate'],
      Latitude: json['Latitude'],
      Longitude: json['Longitude'],
    );
