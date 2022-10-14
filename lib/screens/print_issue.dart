// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/custom_checkbox.dart';
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
    final printIssue = Provider.of<PrintIssueProviders>(context);

    void takeAPhoto() async {
      // hạn chế call api
      // tìm phần tử chưa add image gần nhất

      await printIssue.getIdIssue(1);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraPicker(
            titleCamera: "adu ghe",
            previewImage: true,
            onDelete: (file) {
              return true;
            },
          ),
        ),
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
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/svg/IconCancel2.svg'),
          label: const Text(
            'Cancel',
            style: CustomTextStyle.h6,
          ),
        ),
        BottomNavyBarItem(
          onPressed: takeAPhoto,
          icon: SvgPicture.asset('assets/svg/IconFinish.svg'),
          label: const Text(
            'Finish abort',
            style: CustomTextStyle.h6,
          ),
        ),
      ]),
      body: Container(
        margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "The following Photo are required",
                style: CustomTextStyle.h5.copyWith(color: ColorTheme.grey600),
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
                          title: value.data[index].title),
                    ),
                    itemCount: value.data.length,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
