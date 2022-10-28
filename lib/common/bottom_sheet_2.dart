import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';

class BottomNavyBarItem extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;
  final Widget label;

  const BottomNavyBarItem(
      {required this.onPressed,
      required this.icon,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
    );
  }
}

class BottomSheet2 extends StatefulWidget {
  final double padding;
  final List<BottomNavyBarItem> buttonList;

  const BottomSheet2({this.padding = 30, required this.buttonList, super.key});

  @override
  State<BottomSheet2> createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  Widget verticalLine = Container(
    height: 25,
    decoration: const BoxDecoration(
      border: Border.symmetric(
        vertical: BorderSide(
          width: 0.5,
          color: ColorTheme.grey300,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: ColorTheme.grey300,
          ),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: ColorTheme.grey300,
        //     offset: Offset(0, 5.0),
        //     blurRadius: 20.0,
        //   ),
        // ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.buttonList.length == 1 ? 0 : widget.padding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.buttonList.map(
            (item) {
              return (widget.buttonList.length == 1
                  ? SizedBox(
                      width: widthScreen,
                      child: item,
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: ((widthScreen -
                                  ((widget.padding) * 2) -
                                  widget.buttonList.length -
                                  1) /
                              widget.buttonList.length),
                          child: item,
                        ),
                        if (item !=
                            widget.buttonList[widget.buttonList.length - 1])
                          verticalLine
                      ],
                    ));
            },
          ).toList(),
        ),
      ),
    );
  }
}
