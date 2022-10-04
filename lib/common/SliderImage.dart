import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class SliderImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderImageState();
  }
}

class _SliderImageState extends State<SliderImage> {
  final ScrollController _firstController = ScrollController();
  final CarouselController _controller = CarouselController();
  List<File> files = [];

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  ScrollController scollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = files.map((item) {
      return Image.file(
        item,
        fit: BoxFit.cover,
      );
    }).toList();
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            enlargeCenterPage: false,
            height: MediaQuery.of(context).size.width < 400 ? 200 : 300,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          carouselController: _controller,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 70,
          // width: double.infinity,
          // margin: const EdgeInsets.only(top: 3),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  final results =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraPicker(
                                titleCamera: "Issue parking charge",
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
                child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                      controller: _firstController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            InkWell(
                              onTap: () => _controller.animateToPage(index),
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
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
                            ),
                            Positioned(
                              top: -10,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  // remove(index);
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  padding: const EdgeInsets.all(3.5),
                                  decoration: BoxDecoration(
                                      color: ColorTheme.grey400,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SvgPicture.asset(
                                      "assets/svg/IconCannel.svg"),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: files.length,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
