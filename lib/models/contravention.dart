class Contravention {
  DateTime? created;
  DateTime? deleted;
  int? id;
  int? locationId;
  int? activeAccountId;
  String? analysisKey;
  int? cancellationReasonId;
  String? colour;
  bool? isForeignPlate;
  int? locationRateId;
  int? lowerAmount;
  int? upperAmount;
  String? make;
  Null? model;
  String? plate;
  int? reasonId;
  String? reference;
  int? status;
  int? type;
  int? zoneId;
  Reason? reason;
  DateTime? eventDateTime;
  List<ContraventionEvents>? contraventionEvents;
  List<ContraventionPhotos>? contraventionPhotos;

  Contravention({
    this.created,
    this.deleted,
    this.id,
    this.locationId,
    this.activeAccountId,
    this.analysisKey,
    this.cancellationReasonId,
    this.colour,
    this.isForeignPlate,
    this.locationRateId,
    this.lowerAmount,
    this.upperAmount,
    this.make,
    this.model,
    this.plate,
    this.reasonId,
    this.reference,
    this.status,
    this.type,
    this.zoneId,
    this.reason,
    this.eventDateTime,
    this.contraventionEvents,
    this.contraventionPhotos,
  });

  Contravention.fromJson(Map<String, dynamic> json) {
    created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    deleted = json['Deleted'] == null ? null : DateTime.parse(json['Deleted']);
    id = json['Id'];
    locationId = json['LocationId'];
    activeAccountId = json['ActiveAccountId'];
    analysisKey = json['AnalysisKey'];
    cancellationReasonId = json['CancellationReasonId'];
    colour = json['Colour'];
    isForeignPlate = json['IsForeignPlate'];
    locationRateId = json['LocationRateId'];
    lowerAmount = json['LowerAmount'];
    upperAmount = json['UpperAmount'];
    make = json['Make'];
    model = json['Model'];
    plate = json['Plate'];
    reasonId = json['ReasonId'];
    reference = json['Reference'];
    status = json['Status'];
    type = json['Type'];
    zoneId = json['ZoneId'];
    reason = json['Reason'] != null ? Reason.fromJson(json['Reason']) : null;
    eventDateTime = json['EventDateTime'] == null
        ? null
        : DateTime.parse(json['EventDateTime']);
    if (json['ContraventionEvents'] != null) {
      contraventionEvents = <ContraventionEvents>[];
      json['ContraventionEvents'].forEach((v) {
        contraventionEvents!.add(ContraventionEvents.fromJson(v));
      });
    }
    if (json['ContraventionPhotos'] != null) {
      contraventionPhotos = <ContraventionPhotos>[];
      json['ContraventionPhotos'].forEach((v) {
        contraventionPhotos!.add(ContraventionPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Created'] = created;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['LocationId'] = this.locationId;
    data['ActiveAccountId'] = this.activeAccountId;
    data['AnalysisKey'] = this.analysisKey;
    data['CancellationReasonId'] = this.cancellationReasonId;
    data['Colour'] = this.colour;
    data['IsForeignPlate'] = this.isForeignPlate;
    data['LocationRateId'] = this.locationRateId;
    data['LowerAmount'] = this.lowerAmount;
    data['UpperAmount'] = this.upperAmount;
    data['Make'] = this.make;
    data['Model'] = this.model;
    data['Plate'] = this.plate;
    data['ReasonId'] = this.reasonId;
    data['Reference'] = this.reference;
    data['Status'] = this.status;
    data['Type'] = this.type;
    data['ZoneId'] = this.zoneId;
    if (this.reason != null) {
      data['Reason'] = this.reason!.toJson();
    }
    if (this.contraventionEvents != null) {
      data['ContraventionEvents'] =
          this.contraventionEvents!.map((v) => v.toJson()).toList();
    }
    if (this.contraventionPhotos != null) {
      data['ContraventionPhotos'] =
          this.contraventionPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reason {
  DateTime? created;
  DateTime? deleted;
  int? id;
  String? code;
  int? rateTypeId;
  List<ContraventionReasonTranslations>? contraventionReasonTranslations;

  Reason({
    this.created,
    this.deleted,
    this.id,
    this.code,
    this.rateTypeId,
    this.contraventionReasonTranslations,
  });

  Reason.fromJson(Map<String, dynamic> json) {
    created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    deleted = json['Deleted'] == null ? null : DateTime.parse(json['Deleted']);
    id = json['Id'];
    code = json['Code'];
    rateTypeId = json['RateTypeId'];
    if (json['ContraventionReasonTranslations'] != null) {
      contraventionReasonTranslations = <ContraventionReasonTranslations>[];
      json['ContraventionReasonTranslations'].forEach((v) {
        contraventionReasonTranslations!
            .add(ContraventionReasonTranslations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created'] = this.created;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['Code'] = this.code;
    data['RateTypeId'] = this.rateTypeId;
    if (this.contraventionReasonTranslations != null) {
      data['ContraventionReasonTranslations'] =
          this.contraventionReasonTranslations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContraventionReasonTranslations {
  DateTime? created;
  DateTime? deleted;
  int? id;
  int? contraventionReasonId;
  String? summary;
  String? detail;
  Reason? contraventionReason;

  ContraventionReasonTranslations({
    this.created,
    this.deleted,
    this.id,
    this.contraventionReasonId,
    this.summary,
    this.detail,
    this.contraventionReason,
  });

  ContraventionReasonTranslations.fromJson(Map<String, dynamic> json) {
    created = json['Created'] == null ? null : DateTime.parse(json['Created']);
    deleted = json['Deleted'] == null ? null : DateTime.parse(json['Deleted']);
    id = json['Id'];
    contraventionReasonId = json['ContraventionReasonId'];
    summary = json['Summary'];
    detail = json['Detail'];
    if (json['ContraventionReason'] != null) {
      contraventionReason = Reason.fromJson(json['ContraventionReason']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created'] = this.created;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['ContraventionReasonId'] = this.contraventionReasonId;
    data['Summary'] = this.summary;
    data['Detail'] = this.detail;
    return data;
  }
}

class ContraventionEvents {
  String? created;
  Null? deleted;
  int? id;
  Null? accountId;
  int? contraventionId;
  int? createdByUserId;
  String? detail;
  int? type;

  ContraventionEvents(
      {this.created,
      this.deleted,
      this.id,
      this.accountId,
      this.contraventionId,
      this.createdByUserId,
      this.detail,
      this.type});

  ContraventionEvents.fromJson(Map<String, dynamic> json) {
    created = json['Created'];
    deleted = json['Deleted'];
    id = json['Id'];
    accountId = json['AccountId'];
    contraventionId = json['ContraventionId'];
    createdByUserId = json['CreatedByUserId'];
    detail = json['Detail'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created'] = this.created;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['AccountId'] = this.accountId;
    data['ContraventionId'] = this.contraventionId;
    data['CreatedByUserId'] = this.createdByUserId;
    data['Detail'] = this.detail;
    data['Type'] = this.type;
    return data;
  }
}

class ContraventionPhotos {
  String? created;
  Null? deleted;
  int? id;
  String? capturedDateTime;
  int? contraventionId;
  int? photoType;
  String? blobName;
  String? mimeType;
  Null? modified;
  String? originalFilename;
  int? sizeInBytes;

  ContraventionPhotos(
      {this.created,
      this.deleted,
      this.id,
      this.capturedDateTime,
      this.contraventionId,
      this.photoType,
      this.blobName,
      this.mimeType,
      this.modified,
      this.originalFilename,
      this.sizeInBytes});

  ContraventionPhotos.fromJson(Map<String, dynamic> json) {
    created = json['Created'];
    deleted = json['Deleted'];
    id = json['Id'];
    capturedDateTime = json['CapturedDateTime'];
    contraventionId = json['ContraventionId'];
    photoType = json['PhotoType'];
    blobName = json['BlobName'];
    mimeType = json['MimeType'];
    modified = json['Modified'];
    originalFilename = json['OriginalFilename'];
    sizeInBytes = json['SizeInBytes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Created'] = this.created;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['CapturedDateTime'] = this.capturedDateTime;
    data['ContraventionId'] = this.contraventionId;
    data['PhotoType'] = this.photoType;
    data['BlobName'] = this.blobName;
    data['MimeType'] = this.mimeType;
    data['Modified'] = this.modified;
    data['OriginalFilename'] = this.originalFilename;
    data['SizeInBytes'] = this.sizeInBytes;
    return data;
  }
}

enum ContraventionStatus {
  Open,
  Paid,
  Cancelled,
  Timeout,
  Paused,
}
