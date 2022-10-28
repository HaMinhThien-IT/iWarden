import 'package:flutter/material.dart';
import 'package:iWarden/theme/text_theme.dart';

class OptionRadio extends StatefulWidget {
  final String text;
  final int index;
  final int selectedButton;
  final Function press;

  const OptionRadio(
      {required this.index,
      required this.press,
      required this.selectedButton,
      required this.text,
      super.key});

  @override
  OptionRadioPage createState() => OptionRadioPage();
}

class OptionRadioPage extends State<OptionRadio> {
  // QuestionController controllerCopy =QuestionController();

  int id = 1;
  bool _isButtonDisabled = false;
  int? _selected = null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.index);
      },
      child: Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.grey, disabledColor: Colors.blue),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Transform.translate(
            offset: const Offset(-18, 0),
            child: Text(
              widget.text,
              style: CustomTextStyle.h5,
            ),
          ),
          groupValue: widget.selectedButton,
          value: widget.index,
          activeColor: Colors.green,
          onChanged: (val) async {
            widget.press(widget.index);
          },
          toggleable: true,
        ),
      ),
    );
  }
}
