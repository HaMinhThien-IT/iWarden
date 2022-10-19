import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

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

class ManuallyControlledSlider extends StatefulWidget {
  const ManuallyControlledSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final ScrollController _firstController = ScrollController();
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  ScrollController scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: imgList.map((item) {
            return Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item),
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
          padding: const EdgeInsets.all(8),
          height: 70,
          // width: double.infinity,
          // margin: const EdgeInsets.only(top: 3),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {},
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
                                    child: Image.network(
                                      imgList[index],
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
                      itemCount: imgList.length,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
