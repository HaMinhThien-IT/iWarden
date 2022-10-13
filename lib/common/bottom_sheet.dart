import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/theme/color.dart';

class TextButtonIcon {
  Function onPressed;
  late String iconAsset;
  late Widget label;

  TextButtonIcon(
      {required this.onPressed, required this.iconAsset, required this.label});
}

class BottomSheet extends StatefulWidget {
  final double? padding;
  final int numberOfButtons;
  final void Function()? firstButtonOnPressed;
  final String firstButtonIconAsset;
  final Widget firstButtonLabel;
  final void Function()? secondButtonOnPressed;
  final String secondButtonIconAsset;
  final Widget secondButtonLabel;

  const BottomSheet(
      {this.padding = 30,
      required this.numberOfButtons,
      required this.firstButtonOnPressed,
      required this.firstButtonIconAsset,
      required this.firstButtonLabel,
      required this.secondButtonOnPressed,
      required this.secondButtonIconAsset,
      required this.secondButtonLabel,
      super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
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
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.numberOfButtons == 1 ? 0 : widget.padding ?? 30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.numberOfButtons == 1)
              SizedBox(
                width: widthScreen,
                child: TextButton.icon(
                  onPressed: widget.firstButtonOnPressed,
                  icon: SvgPicture.asset(widget.firstButtonIconAsset),
                  label: widget.firstButtonLabel,
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                  ),
                ),
              ),
            if (widget.numberOfButtons == 2)
              SizedBox(
                width: ((widthScreen / 2) - (widget.padding ?? 30)) - 12,
                child: TextButton.icon(
                  onPressed: widget.firstButtonOnPressed,
                  icon: SvgPicture.asset(widget.firstButtonIconAsset),
                  label: widget.firstButtonLabel,
                ),
              ),
            if (widget.numberOfButtons == 2)
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
            if (widget.numberOfButtons == 2)
              SizedBox(
                width: ((widthScreen / 2) - (widget.padding ?? 30)) - 12,
                child: TextButton.icon(
                  onPressed: widget.secondButtonOnPressed,
                  icon: SvgPicture.asset(widget.secondButtonIconAsset),
                  label: widget.secondButtonLabel,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
