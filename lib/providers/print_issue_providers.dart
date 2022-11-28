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
    PrintIssue(id: 1, title: "Vehicle & Background", image: null),
    PrintIssue(id: 2, title: "Screen with ticket on", image: null),
    PrintIssue(id: 3, title: "Close up of contravention", image: null),
    // PrintIssue(id: 4, title: "Vehicle & Signage", image: null),
    // PrintIssue(id: 5, title: "Signage", image: null),
    // PrintIssue(id: 6, title: "Optional photo 1", image: null),
    // PrintIssue(id: 7, title: "Optional photo 2", image: null),
    // PrintIssue(id: 8, title: "Optional photo 3", image: null),
    // PrintIssue(id: 9, title: "Optional photo 4", image: null),
  ];

  late int idIssue;

  void resetData() {
    for (int i = 0; i < _data.length; i++) {
      _data[i].image = null;
    }
  }

  Future getIdIssue(id) async {
    if (id != null) {
      idIssue = id;
      notifyListeners();
    } else {
      return;
    }
  }

  PrintIssue findIssueNoImage() {
    return _data.firstWhere(
      (element) => element.image == null,
      orElse: () => PrintIssue(
        id: _data.length + 1,
        title: "null",
        image: _data[0].image,
      ),
    );
  }

  void addImageToIssue(int id, File image) {
    print({
      id,
      image,
    });

    final PrintIssue temp = _data.firstWhere((element) => element.id == id);
    temp.image = image;
    notifyListeners();
  }

  late bool checkNullImage = data.every((element) => element.image == null);
  List<PrintIssue> get data {
    return [..._data];
  }
}
