import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;
  final String title;
  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = ColorTheme.success,
    this.checkedFillColor = Colors.teal,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
    required this.title,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color iconColor;
    late IconData? iconData;

    switch (_status) {
      case CheckStatus.checked:
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        iconColor = widget.uncheckedIconColor;
        iconData = null;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 5)),
        border: Border.all(
          color: _checked ? widget.checkedIconColor : ColorTheme.grey600,
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 1.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!_checked),
      child: Row(
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: _buildIcon(),
            onPressed: () => widget.onChanged(!_checked),
            splashRadius: widget.splashRadius,
            splashColor: widget.splashColor,
            tooltip: widget.tooltip,
            mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
          ),
          const SizedBox(
            width: 11,
          ),
          Text(
            widget.title,
            style: CustomTextStyle.h5,
          )
        ],
      ),
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
