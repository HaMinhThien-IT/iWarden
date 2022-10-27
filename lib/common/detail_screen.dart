import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/slide_image.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/detail_issue.dart';

import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class DetailScreen extends StatefulWidget {
  final TypeFirstSeen type;

  const DetailScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final padding = widget.type == TypeFirstSeen.Expired ? 30.0 : 05.0;
    final divisor = widget.type == TypeFirstSeen.Expired ? 3 : 2;
    final divisor2 = widget.type == TypeFirstSeen.Expired ? 0.00 : 12;
    final bool _isCamera = widget.type == TypeFirstSeen.Expired ? true : false;
    List<File> arrayImage = [];
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    ];
    return Scaffold(
      appBar: MyAppBar(
          title: "bd5i smr".toUpperCase(), automaticallyImplyLeading: true),
      drawer: const MyDrawer(),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: ColorTheme.grey300),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ((widthScreen / divisor) - padding) - divisor2,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/IconCar.svg",
                      width: 16,
                    ),
                    label: const Text(
                      "Car left",
                      style: CustomTextStyle.h6,
                    )),
              ),
              if (widget.type == TypeFirstSeen.Expired)
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
              if (widget.type == TypeFirstSeen.Expired)
                SizedBox(
                  width: ((widthScreen / divisor) - padding) - divisor2,
                  child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(IssuePCNFirstSeenScreen.routeName);
                      },
                      icon: SvgPicture.asset(
                        "assets/svg/IconCharges2.svg",
                        width: 16,
                      ),
                      label: const Text(
                        "Issue PCN",
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
                width: ((widthScreen / divisor) - padding) - divisor2,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/IconLocation.svg",
                      width: 16,
                    ),
                    label: const Text(
                      "Located",
                      style: CustomTextStyle.h6,
                    )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width < 400
                  ? 0
                  : ConstSpacing.bottom),
          child: Column(
            children: <Widget>[
              const DetailIssue(),
              Container(
                color: widget.type == TypeFirstSeen.Expired
                    ? ColorTheme.lightDanger
                    : ColorTheme.lightSuccess,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Text(
                  "Expiring in: 1hr 12min",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.h5.copyWith(
                      color: widget.type == TypeFirstSeen.Expired
                          ? ColorTheme.danger
                          : ColorTheme.success),
                ),
              ),
              AddImage(
                isSlideImage: true,
                listImage: imgList,
                isCamera: _isCamera,
                onAddImage: () async {
                  final results =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraPicker(
                                titleCamera: "Add",
                                onDelete: (file) {
                                  return true;
                                },
                              )));
                  if (results != null) {
                    setState(() {
                      arrayImage = List.from(results);
                    });
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
