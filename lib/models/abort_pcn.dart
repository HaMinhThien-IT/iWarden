import 'package:iWarden/models/base_model.dart';

class AbortPCN {
  final int contraventionId;
  final int cancellationReasonId;
  final String? comment;

  AbortPCN({
    required this.contraventionId,
    required this.cancellationReasonId,
    this.comment,
  });

  factory AbortPCN.fromJson(Map<String, dynamic> json) =>
      _$AbortPCNFromJson(json);

  Map<String, dynamic> toJson() => _$AbortPCNToJson(this);
}

AbortPCN _$AbortPCNFromJson(Map<String, dynamic> json) {
  return AbortPCN(
    contraventionId: json['ContraventionId'],
    cancellationReasonId: json['CancellationReasonId'],
    comment: json['comment'],
  );
}

Map<String, dynamic> _$AbortPCNToJson(AbortPCN instance) {
  return <String, dynamic>{
    'ContraventionId': instance.contraventionId,
    'CancellationReasonId': instance.cancellationReasonId,
    'comment': instance.comment,
  };
}

class CancellationReason extends BaseModel {
  final String group;
  final String reason;
  final bool requiresMandatoryNotes;

  CancellationReason({
    int? Id,
    DateTime? Created,
    DateTime? Deleted,
    required this.group,
    required this.reason,
    required this.requiresMandatoryNotes,
  }) : super(Id: Id, Created: Created, Deleted: Deleted);

  factory CancellationReason.fromJson(Map<String, dynamic> json) =>
      _$CancellationReasonFromJson(json);
}

CancellationReason _$CancellationReasonFromJson(Map<String, dynamic> json) {
  return CancellationReason(
    Id: json['Id'],
    Created: json['Created'] == null ? null : DateTime.parse(json['Created']),
    Deleted: json['Deleted'] == null ? null : DateTime.parse(json['Deleted']),
    group: json['Group'],
    reason: json['Reason'],
    requiresMandatoryNotes: json['RequiresMandatoryNotes'],
  );
}
