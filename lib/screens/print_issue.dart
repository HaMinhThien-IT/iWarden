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
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
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
      appBar: const MyAppBar(
        title: "UKPC take picture",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
          onPressed: () {
            if (printIssue.checkNullImage) {
              _showMyDialog();
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: SvgPicture.asset('assets/svg/IconComplete.svg'),
          label: const Text(
            'Complete',
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
      ]),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.white,
                height: heightScreen / 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "The following Photo are required",
                        style: CustomTextStyle.h5.copyWith(
                          color: ColorTheme.grey600,
                        ),
                      ),
                      Consumer<PrintIssueProviders>(
                        builder: (_, value, __) => Expanded(
                          child: ListView.builder(
                            itemBuilder: (_, index) => InkWell(
                              onTap: () async {
                                value.getIdIssue(value.data[index].id);
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CameraPicker(
                                      titleCamera: value.data[index].title,
                                      previewImage: true,
                                      onDelete: (file) {
                                        return true;
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: CustomCheckBox(
                                value: value.data[index].image != null,
                                onChanged: (val) {
                                  value.onChecked(val, index);
                                },
                                title: value.data[index].title,
                              ),
                            ),
                            itemCount: value.data.length,
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    CustomCheckBox(
                      checkedIconColor: ColorTheme.grey600,
                      value: true,
                      onChanged: (val) {},
                      title: 'Comment',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter comment',
                        hintMaxLines: 1,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
