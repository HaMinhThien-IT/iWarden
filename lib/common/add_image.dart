import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/screens/first-seen/add-first-seen/add_first_seen_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

// ignore: must_be_immutable
class AddImage extends StatefulWidget {
  final bool isSlideImage;
  final bool isCamera;
  List<dynamic> listImage;
  final VoidCallback onAddImage;
  AddImage({
    Key? key,
    this.isSlideImage = false,
    this.isCamera = false,
    required this.onAddImage,
    required this.listImage,
  }) : super(key: key);
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final CarouselController _controller = CarouselController();
  void remove(int index) {
    setState(() {
      widget.listImage.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.isSlideImage)
            CarouselSlider(
              items: widget.listImage.map((item) {
                return Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (item.runtimeType == String) == false
                        ? NetworkImage(item)
                        : NetworkImage(item),
                    fit: BoxFit.cover,
                  ),
                ));
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: false,
                height: MediaQuery.of(context).size.width < 400 ? 200 : 300,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {});
                },
              ),
              carouselController: _controller,
            ),
          Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // if (AddFirstSeenScreen.routeName ==
                  //     ModalRoute.of(context)!.settings.name)
                  Text(
                    "Evidence photos (${widget.listImage.length})",
                    style: CustomTextStyle.h5
                        .copyWith(color: ColorTheme.darkPrimary),
                  ),
                  if (AddFirstSeenScreen.routeName ==
                      ModalRoute.of(context)!.settings.name)
                    const SizedBox(
                      height: 16,
                    ),
                  Row(
                    children: <Widget>[
                      if (widget.isCamera)
                        InkWell(
                          onTap: widget.onAddImage,
                          child: Container(
                            height: 56.0,
                            width: widget.listImage.isEmpty
                                ? MediaQuery.of(context).size.width - (24)
                                : 56.0,
                            margin: EdgeInsets.only(
                                right: widget.listImage.isEmpty ? 0 : 15),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: ColorTheme.grey200,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child:
                                  SvgPicture.asset("assets/svg/IconCamera.svg"),
                            ),
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          height: widget.isCamera ? 70.0 : 56.0,
                          child: Scrollbar(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () =>
                                        _controller.animateToPage(index),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: widget.isCamera ? 15 : 8,
                                          top: widget.isCamera ? 7 : 0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: SizedBox(
                                          width: 56.0,
                                          height: 56.0,
                                          child: widget.listImage[index]
                                                      .runtimeType ==
                                                  String
                                              ? Image.network(
                                                  widget.listImage[index],
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  widget.listImage[index],
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (widget.isCamera)
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/svg/IconCannel.svg",
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              itemCount: widget.listImage.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
