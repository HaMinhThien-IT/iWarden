import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class AddImage extends StatefulWidget {
  final String titleCamera;
  const AddImage({Key? key, required this.titleCamera}) : super(key: key);
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  List<File> arrayImage = [];
  void remove(int index) {
    setState(() {
      arrayImage.removeAt(index);
    });
  }

  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Images (${arrayImage.length})",
                style:
                    CustomTextStyle.h5.copyWith(color: ColorTheme.darkPrimary),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      final results =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CameraPicker(
                                    titleCamera: widget.titleCamera,
                                    initialFiles: files,
                                    onDelete: (file) {
                                      return true;
                                    },
                                  )));
                      if (results != null) {
                        setState(() {
                          files = List.from(results);
                        });
                      }
                    },
                    child: Container(
                      height: 56.0,
                      width: 56.0,
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColorTheme.grey200,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: SvgPicture.asset("assets/svg/IconCamera.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70.0,
                      child: Scrollbar(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // clipBehavior: Clip.none,
                          itemBuilder: (context, index) => Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 15, top: 7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: Image.file(
                                      files[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    remove(index);
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                      color: ColorTheme.grey400,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/svg/IconCannel.svg",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          itemCount: files.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
