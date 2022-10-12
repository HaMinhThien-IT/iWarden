// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
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
    return Scaffold(
      appBar: const MyAppBar(
        title: "UKPC take picture",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
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
