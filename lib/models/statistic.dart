class StatisticWardenPropsFilter {
  final int zoneId;
  final DateTime timeStart;
  final DateTime timeEnd;
  StatisticWardenPropsFilter(
      {required this.zoneId, required this.timeEnd, required this.timeStart});
}

class StatisticWardenPropsData {
  final int abortedPCN;
  final int firstSeen;
  final int gracePeriod;
  final int issuedPCN;

  StatisticWardenPropsData(
      {required this.abortedPCN,
      required this.firstSeen,
      required this.gracePeriod,
      required this.issuedPCN});

  // StatisticWardenPropsData.fromJson(Map<String, dynamic> json) {
  //   abortedPCN = json['AbortedPCN'];
  //   firstSeen = json['FirstSeen'];
  //   gracePeriod = json['GracePeriod'];
  //   issuedPCN = json['IssuedPCN'];
  // }
  factory StatisticWardenPropsData.fromJson(Map<String, dynamic> json) =>
      statisticFromJson(json);
}

StatisticWardenPropsData statisticFromJson(Map<String, dynamic> json) {
  return StatisticWardenPropsData(
      abortedPCN: json['AbortedPCN'],
      firstSeen: json['FirstSeen'],
      gracePeriod: json['GracePeriod'],
      issuedPCN: json['IssuedPCN']);
}
