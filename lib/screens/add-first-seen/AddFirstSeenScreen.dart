import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/common/ToastSuccess.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFirstSeenScreen extends StatefulWidget {
  static const routeName = '/add-first-seen';
  const AddFirstSeenScreen({super.key});

  @override
  State<AddFirstSeenScreen> createState() => _AddFirstSeenScreenState();
}

class _AddFirstSeenScreenState extends State<AddFirstSeenScreen> {
  late FToast fToast;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      key: globalKey,
      appBar: const MyAppBar(
        title: "Add first seen",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      bottomSheet: Container(
          decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(width: 1, color: ColorTheme.grey300))),
          width: double.infinity,
          child: TextButton.icon(
              onPressed: () {
                fToast.showToast(
                  child: const ToastSuccess(
                    msg: "Saved successfully",
                  ),
                  gravity: ToastGravity.BOTTOM_LEFT,
                  fadeDuration: 200,
                  toastDuration: const Duration(seconds: 2),
                );
              },
              icon: SvgPicture.asset("assets/svg/IconSave.svg"),
              label: const Text(
                "Save",
                style: CustomTextStyle.h6,
              ))),
      body: Container(
        margin: const EdgeInsets.only(bottom: ConstSpacing.bottom),
        child: AddImage(),
      ),
    );
  }
}
