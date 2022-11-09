import 'package:iWarden/models/address.dart';
import 'package:iWarden/models/base_model.dart';
import 'package:iWarden/models/operational_period.dart';
import 'package:iWarden/models/zone.dart';

class LocationPattern {
  final String static;
  final String mobile;

  const LocationPattern({required this.static, required this.mobile});
}

class Location extends BaseModel with AddressLocation {
  final String Name;
  final LocationPattern? LocationType;
  final int? Revenue;
  final int? CountryRegionId;
  final int CountrySubRegionId;
  final int? ClusterId;
  final int? Longitude;
  final int? Latitude;

  Location({
    Id,
    Created,
    Deleted,
    Address,
    Address1,
    Address2,
    Address3,
    Town,
    Country,
    Postcode,
    required this.Name,
    this.LocationType,
    this.Revenue,
    this.CountryRegionId,
    required this.CountrySubRegionId,
    this.ClusterId,
    this.Longitude,
    this.Latitude,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  // Location.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       label = json['label'],
  //       value = json['value'];
}

class LocationWithZones extends Location {
  final List<Zone>? Zones;
  final List<OperationalPeriod>? OperationalPeriods;
  final int? GracePeriod;
  final int? TimeLimit;

  LocationWithZones({
    Id,
    Created,
    Deleted,
    Name,
    CountrySubRegionId,
    this.Zones,
    this.OperationalPeriods,
    this.GracePeriod,
    this.TimeLimit,
  }) : super(
          Id: Id,
          Created: Created,
          Deleted: Deleted,
          Name: Name,
          CountrySubRegionId: CountrySubRegionId,
        );

  // LocationWithZones.fromJson(Map<String, dynamic> json)
  //     : Zones = json['Zones'],
  //       OperationalPeriods = json['OperationalPeriods'],
  //       GracePeriod = json['GracePeriod'],
  //       TimeLimit = json['TimeLimit'];
}
