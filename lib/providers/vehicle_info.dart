import 'package:flutter/foundation.dart';
import 'package:iWarden/controllers/vehicle_information_controller.dart';
import 'package:iWarden/models/pagination.dart';
import 'package:iWarden/models/vehicle_information.dart';

class VehicleInfo with ChangeNotifier {
  static final vehicleInfoController = VehicleInfoController();
  List<VehicleInformation> firstSeenList = [];
  List<VehicleInformation> gracePeriodList = [];

  Future<List<VehicleInformation>> getFirstSeenList(
      {int? page, int? pageSize}) async {
    final Pagination list = await vehicleInfoController.getVehicleInfoList(
      vehicleInfoType: VehicleInformationType.FIRST_SEEN.index,
      page: page,
      pageSize: pageSize,
    );
    firstSeenList =
        list.rows.map((item) => VehicleInformation.fromJson(item)).toList();
    return firstSeenList;
  }

  Future<List<VehicleInformation>> getGracePeriodList(
      {int? page, int? pageSize}) async {
    final Pagination list = await vehicleInfoController.getVehicleInfoList(
      vehicleInfoType: VehicleInformationType.GRACE_PERIOD.index,
      page: page,
      pageSize: pageSize,
    );
    gracePeriodList =
        list.rows.map((item) => VehicleInformation.fromJson(item)).toList();
    return gracePeriodList;
  }
}
