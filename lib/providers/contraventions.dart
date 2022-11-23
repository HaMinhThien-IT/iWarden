import 'package:flutter/foundation.dart';
import 'package:iWarden/controllers/contravention_controller.dart';
import 'package:iWarden/models/ContraventionService.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/models/pagination.dart';

class Contraventions with ChangeNotifier {
  static final contraventionController = ContraventionController();
  static List<Contravention> contraventionList = [];

  Future<List<Contravention>> getContraventionList(
      {int? page, int? pageSize}) async {
    final Pagination list = await contraventionController
        .getContraventionServiceList(page: page, pageSize: pageSize);
    contraventionList =
        list.rows.map((item) => Contravention.fromJson(item)).toList();
    return contraventionList;
  }
}
