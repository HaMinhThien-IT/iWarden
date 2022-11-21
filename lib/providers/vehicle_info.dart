import 'package:flutter/foundation.dart';
import 'package:iWarden/controllers/vehicle_information_controller.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:iWarden/models/vehicle_information.dart';

class VehicleInfo with ChangeNotifier {
  static final vehicleInfoController = VehicleInfoController();
  List<VehicleInformation> firstSeenList = [];

  Future<List<VehicleInformation>> getFirstSeenList(
      {required int vehicleInfoType, int? page, int? pageSize}) async {
    final Pagination list = await vehicleInfoController.getVehicleInfoList(
      vehicleInfoType: vehicleInfoType,
      page: page,
      pageSize: pageSize,
    );
    firstSeenList =
        list.rows.map((item) => VehicleInformation.fromJson(item)).toList();
    return firstSeenList;
  }
}
