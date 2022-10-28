// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/custom_checkbox.dart';
import 'package:iWarden/common/my_dialog.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/parking-charges/preview_photo.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/take_photo_item.dart';
import 'package:provider/provider.dart';

class PrintIssue extends StatefulWidget {
  static const routeName = '/print-issue';
  const PrintIssue({super.key});

  @override
  State<PrintIssue> createState() => _PrintIssueState();
}

class _PrintIssueState extends State<PrintIssue> {
  @override
  void initState() {
    super.initState();
  }

  List<File> files = [];
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;

    final printIssue = Provider.of<PrintIssueProviders>(context);

    void takeAPhoto() async {
      await printIssue.getIdIssue(printIssue.findIssueNoImage().id);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraPicker(
            titleCamera: printIssue.findIssueNoImage().title,
            previewImage: true,
            onDelete: (file) {
              return true;
            },
          ),
        ),
      );
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: ColorTheme.backdrop,
        builder: (BuildContext context) {
          return MyDialog(
            title: "Cannot complete",
            subTitle: "Please take enough proof photos to complete.",
            func: ElevatedButton(child: const Text("Ok"), onPressed: () {}),
          );
        },
      );
    }

    return Scaffold(
      // appBar: const MyAppBar(
      //   title: "UKPC take picture",
      //   automaticallyImplyLeading: true,
      // ),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(padding: 5, buttonList: [
        BottomNavyBarItem(
          onPressed: () {
            Navigator.of(context).pushNamed(AbortScreen.routeName);
          },
          icon: SvgPicture.asset('assets/svg/IconAbort.svg'),
          label: const Text(
            'Abort',
            style: CustomTextStyle.h6,
          ),
        ),
        BottomNavyBarItem(
          onPressed: takeAPhoto,
          icon: SvgPicture.asset(
            'assets/svg/IconCamera.svg',
            width: 17,
          ),
          label: const Text(
            'Take a photo',
            style: CustomTextStyle.h6,
          ),
        ),
        BottomNavyBarItem(
          onPressed: () {
            // if (printIssue.checkNullImage) {
            //   _showMyDialog();
            // } else {
            //   Navigator.of(context).pop();
            // }
            Navigator.of(context).pushNamed(PreviewPhoto.routeName);
          },
          icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
          label: const Text(
            'Complete',
            style: CustomTextStyle.h6,
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: ColorTheme.darkPrimary,
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    "Take photos",
                    style: CustomTextStyle.h4.copyWith(color: Colors.white),
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Please take required photos as below:",
                                style: CustomTextStyle.h5.copyWith(
                                  color: ColorTheme.grey600,
                                ),
                              ),
                              Consumer<PrintIssueProviders>(
                                builder: (_, value, __) => Column(
                                  children: value.data
                                      .map((e) => const TakePhotoItem())
                                      .toList(),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter comment',
                            hintMaxLines: 1,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
