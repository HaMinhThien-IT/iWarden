class Wardens {
  final int Id;
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
  final int Latitude;
  final int Longitude;
  final DateTime? CreatedAt;
  final DateTime? DeletedAt;

  const Wardens({
    required this.Id,
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
    this.CreatedAt,
    this.DeletedAt,
  });

  // Wardens.fromJson(Map<String, dynamic> json) : Id = json['Id'], ExternalId = json['ExternalId'], CountrySubRegionId = json['CountrySubRegionId'], FistName = json['FistName'], LastName = json['']
}
