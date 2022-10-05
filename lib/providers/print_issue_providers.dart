import 'package:flutter/cupertino.dart';
import 'package:iWarden/common/Customcheckbox.dart';

class PrintIssue {
  final String title;
  PrintIssue({required this.title});
}

class PrintIssueProviders with ChangeNotifier {
  final List<PrintIssue> _data = [
    PrintIssue(title: "Vehicle & BackGround"),
    PrintIssue(title: "Screen with ticket on"),
    PrintIssue(title: "Close up of contravention"),
    PrintIssue(title: "Signage"),
    PrintIssue(title: "Optional photo 1"),
    PrintIssue(title: "Optional photo 2")
  ];

  late List<bool> listChecked = List<bool>.filled(_data.length, false);

  void onChecked(bool checked, int index) {
    listChecked[index] = checked;
    print(listChecked);
    notifyListeners();
  }

  List<PrintIssue> get data {
    return [..._data];
  }
}
