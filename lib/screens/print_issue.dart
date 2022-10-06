import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/Customcheckbox.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
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

  Future clearArray(List arr) async {
    return arr = [];
  }

  List<File> files = [];
  bool check = false;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    const padding = 30.0;
    return ChangeNotifierProvider(
      create: (_) => PrintIssueProviders(),
      child: Scaffold(
        appBar: const MyAppBar(
          title: "UKPC take picture",
          automaticallyImplyLeading: true,
        ),
        drawer: const MyDrawer(),
        body: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Text(
              "The following Photo are required",
              style: CustomTextStyle.h5.copyWith(color: ColorTheme.grey600),
            ),
            Consumer<PrintIssueProviders>(
              builder: (_, value, __) => Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => InkWell(
                    onTap: () async {
                      var results =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CameraPicker(
                                    titleCamera: value.data[index].title,
                                    onDelete: (file) {
                                      return true;
                                    },
                                  )));
                      print("results == null");
                      print(results != null);
                      print(results);
                      if (check == false && results != null) {
                        print("results != null");
                        print(results);
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: Colors.black45,
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            pageBuilder: (BuildContext buildContext,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return Scaffold(
                                  appBar: const MyAppBar(
                                    title: "UKPC take picture",
                                    automaticallyImplyLeading: true,
                                  ),
                                  drawer: const MyDrawer(),
                                  bottomSheet: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: ColorTheme.grey300),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: padding),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width:
                                                ((widthScreen / 2) - padding) -
                                                    12,
                                            child: TextButton.icon(
                                                onPressed: () async {
                                                  results = await Navigator.of(
                                                          context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      CameraPicker(
                                                                        titleCamera: value
                                                                            .data[index]
                                                                            .title,
                                                                        onDelete:
                                                                            (file) {
                                                                          return true;
                                                                        },
                                                                      )));
                                                  value.addImageToIssue(
                                                      value.data[index].id,
                                                      results[0]);
                                                },
                                                icon: SvgPicture.asset(
                                                    "assets/svg/IconDelete.svg"),
                                                label: const Text(
                                                  "Delete",
                                                  style: CustomTextStyle.h6,
                                                )),
                                          ),
                                          Container(
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              border: Border.symmetric(
                                                vertical: BorderSide(
                                                  width: 0.5,
                                                  color: ColorTheme.grey300,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                ((widthScreen / 2) - padding) -
                                                    12,
                                            child: TextButton.icon(
                                              onPressed: () {
                                                print("IconComplete");
                                                results != null
                                                    ? value.addImageToIssue(
                                                        value.data[index].id,
                                                        results[0])
                                                    : null;
                                                Navigator.of(context).pop();
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/svg/IconComplete.svg"),
                                              label: const Text(
                                                "Accept",
                                                style: CustomTextStyle.h6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  body: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            color: Colors.white,
                                            child: Text(
                                              "Please Accept or Delete the Photo",
                                              style: CustomTextStyle.h5
                                                  .copyWith(
                                                      color:
                                                          ColorTheme.grey600),
                                            ),
                                          ),
                                          if (results != null)
                                            Image.file(
                                              results[0],
                                              fit: BoxFit.cover,
                                            )
                                        ]),
                                  ));
                            });
                      }
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
      ),
    );
  }
}
