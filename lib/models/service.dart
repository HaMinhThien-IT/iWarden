import 'package:iWarden/models/base_model.dart';

class Service extends BaseModel {
  final int ZoneId;
  final int? ServiceType;
  final int? Status;
  final DateTime? InstallDate;
  final DateTime? GoLiveDate;
  final DateTime? TerminationDate;
  final String? Notes;
  final ServiceConfigModel ServiceConfig;

  Service({
    int? Id,
    DateTime? Created,
    DateTime? Deleted,
    required this.ZoneId,
    this.ServiceType,
    this.Status,
    this.InstallDate,
    this.GoLiveDate,
    this.TerminationDate,
    this.Notes,
    required this.ServiceConfig,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      Id: json['Id'],
      Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
      Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
      ZoneId: json['ZoneId'],
      ServiceType: json['ServiceType'],
      Status: json['Status'],
      InstallDate: json['InstallDate'] == null
          ? null
          : DateTime.parse(json['InstallDate']),
      GoLiveDate: json['GoLiveDate'] == null
          ? null
          : DateTime.parse(json['GoLiveDate']),
      TerminationDate: json['TerminationDate'] == null
          ? null
          : DateTime.parse(json['TerminationDate']),
      Notes: json['Notes'],
      ServiceConfig: ServiceConfigModel.fromJson(json['ServiceConfig']),
    );

class ServiceConfigModel {
  final String? WardenNotes;
  final IssuePCNTypeModel IssuePCNType;

  ServiceConfigModel({this.WardenNotes, required this.IssuePCNType});

  factory ServiceConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceConfigModelFromJson(json);
}

ServiceConfigModel _$ServiceConfigModelFromJson(Map<String, dynamic> json) {
  return ServiceConfigModel(
    WardenNotes: json['WardenNotes'],
    IssuePCNType: IssuePCNTypeModel.fromJson(
      json['IssuePCNType'],
    ),
  );
}

class IssuePCNTypeModel {
  final bool Physical;
  final bool Virtual;

  IssuePCNTypeModel({required this.Physical, required this.Virtual});

  factory IssuePCNTypeModel.fromJson(Map<String, dynamic> json) =>
      _$IssuePCNTypeModelFromJson(json);
}

IssuePCNTypeModel _$IssuePCNTypeModelFromJson(Map<String, dynamic> json) =>
    IssuePCNTypeModel(
      Physical: json['Physical'],
      Virtual: json['Virtual'],
    );
