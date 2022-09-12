import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/common/LabelRequire.dart';
import 'package:iWarden/common/ButtonScan.dart';
import 'package:iWarden/common/ToastSuccess.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFirstSeenScreen extends StatefulWidget {
  static const routeName = 'add-first-seen';
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
    final widthScreen = MediaQuery.of(context).size.width;
    const padding = 30.0;

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
          border: Border(
            top: BorderSide(width: 1, color: ColorTheme.grey300),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ((widthScreen / 2) - padding) - 12,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                    label: const Text(
                      "First seen list",
                      style: CustomTextStyle.h6,
                    )),
              ),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        vertical:
                            BorderSide(width: 0.5, color: ColorTheme.grey300))),
              ),
              SizedBox(
                width: ((widthScreen / 2) - padding) - 12,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconSave.svg"),
                    label: const Text(
                      "Save",
                      style: CustomTextStyle.h6,
                    )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                  color: Colors.white,
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            style: CustomTextStyle.h5,
                            decoration: const InputDecoration(
                              labelText: "VRN",
                              hintText: "Enter VRN",
                            )),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                AddImage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
