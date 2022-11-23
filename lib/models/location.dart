import 'dart:convert';

import 'package:iWarden/models/base_model.dart';
import 'package:iWarden/models/operational_period.dart';
import 'package:iWarden/models/zone.dart';

class Location extends BaseModel {
  final String Name;
  final String? LocationType;
  final int? Revenue;
  final int? CountryRegionId;
  final int CountrySubRegionId;
  final int? ClusterId;
  final num? Longitude;
  final num? Latitude;
  final String? Address;
  final String? Address1;
  final String? Address2;
  final String? Address3;
  final String? Town;
  final String? Country;
  final String? Postcode;

  Location({
    int? Id,
    DateTime? Created,
    DateTime? Deleted,
    this.Address,
    this.Address1,
    this.Address2,
    this.Address3,
    this.Town,
    this.Country,
    this.Postcode,
    required this.Name,
    this.LocationType,
    this.Revenue,
    this.CountryRegionId,
    required this.CountrySubRegionId,
    this.ClusterId,
    this.Longitude,
    this.Latitude,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);
}

class LocationWithZones extends Location {
  final List<Zone>? Zones;
  final List<OperationalPeriod>? OperationalPeriods;
  final int? GracePeriod;
  final int? TimeLimit;

  LocationWithZones({
    int? Id,
    DateTime? Created,
    DateTime? Deleted,
    String? Address,
    String? Address1,
    String? Address2,
    String? Address3,
    String? Town,
    String? Country,
    String? Postcode,
    required String Name,
    String? LocationType,
    int? Revenue,
    int? CountryRegionId,
    required int CountrySubRegionId,
    int? ClusterId,
    num? Longitude,
    num? Latitude,
    this.Zones,
    this.OperationalPeriods,
    this.GracePeriod,
    this.TimeLimit,
  }) : super(
          Id: Id,
          Created: Created,
          Deleted: Deleted,
          Address: Address,
          Name: Name,
          CountrySubRegionId: CountrySubRegionId,
          Postcode: Postcode,
        );

  factory LocationWithZones.fromJson(Map<String, dynamic> json) =>
      _$LocationWithZonesFromJson(json);
}

LocationWithZones _$LocationWithZonesFromJson(Map<String, dynamic> json) {
  var zonesFromJson = json['Zones'] as List<dynamic>;
  List<Zone> zonesList =
      zonesFromJson.map((model) => Zone.fromJson(model)).toList();

  return LocationWithZones(
    Id: json['Id'],
    Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
    Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
    Address: json['Address'],
    Address1: json['Address1'],
    Address2: json['Address2'],
    Address3: json['Address3'],
    Town: json['Town'],
    Country: json['Country'],
    Postcode: json['Postcode'],
    Name: json['Name'],
    LocationType: json['LocationType'],
    Revenue: json['Revenue'],
    CountryRegionId: json['CountryRegionId'],
    CountrySubRegionId: json['CountrySubRegionId'],
    ClusterId: json['ClusterId'],
    Longitude: json['Longitude'],
    Latitude: json['Latitude'],
    Zones: zonesList,
    OperationalPeriods: json['OperationalPeriods'],
    GracePeriod: json['GracePeriod'],
    TimeLimit: json['TimeLimit'],
  );
}
