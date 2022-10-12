import 'package:flutter/material.dart';
import 'package:iWarden/common/detail_screen.dart';
import 'package:iWarden/models/first_seen.dart';

class DetailExpriedFirstSeen extends StatelessWidget {
  static const routeName = '/first-seen-expired-detail';
  const DetailExpriedFirstSeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DetailScreen(
      type: TypeFirstSeen.Expired,
    );
  }
}
