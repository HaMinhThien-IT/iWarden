import 'dart:io';

import 'package:flutter/cupertino.dart';

class PrintIssue {
  final int id;
  final String title;
  File? image;
  PrintIssue({required this.id, required this.title, this.image});
}

class PrintIssueProviders with ChangeNotifier {
  final List<PrintIssue> _data = [
    PrintIssue(id: 1, title: "Vehicle & BackGround"),
    PrintIssue(id: 2, title: "Screen with ticket on"),
    PrintIssue(id: 3, title: "Close up of contravention"),
    PrintIssue(id: 4, title: "Signage"),
    PrintIssue(id: 5, title: "Optional photo 1"),
    PrintIssue(id: 6, title: "Optional photo 2")
  ];

  late List<bool> listChecked = List<bool>.filled(_data.length, false);

  void onChecked(bool checked, int index) {
    listChecked[index] = checked;
    notifyListeners();
  }

  void addImageToIssue(int id, File image) {
    final PrintIssue temp = _data.firstWhere((element) => element.id == id);
    temp.image = image;
    notifyListeners();
  }

  List<PrintIssue> get data {
    return [..._data];
  }
}
