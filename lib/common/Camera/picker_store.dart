import 'dart:io';

import 'package:flutter/foundation.dart';

class PickerStore extends ChangeNotifier {
  final int? maxPicture;
  final int minPicture;
  final List<File> filesData;

  PickerStore(
      {this.maxPicture, required this.minPicture, required this.filesData});

  bool get canContinue =>
      filesData.length >= minPicture &&
      (maxPicture == null || filesData.length < maxPicture!);

  void addFile(File file) {
    filesData.add(file);
    notifyListeners();
  }

  void removeFile(File file) async {
    filesData.remove(file);
    notifyListeners();
    try {
      await File(file.path).delete();
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
  }
}
