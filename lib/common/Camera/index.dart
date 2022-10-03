import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';

class MyCamera extends StatefulWidget {
  const MyCamera({super.key});

  @override
  State<MyCamera> createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (files.isEmpty) const Text('You didn\'t select any files'),
            if (files.isNotEmpty) ImagesPreview(files: files),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final results =
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CameraPicker(
                              titleCamera: "Ahihihih",
                              initialFiles: files,
                              onDelete: (file) {
                                return true;
                              },
                            )));
                if (results != null) {
                  setState(() {
                    files = List.from(results);
                  });
                }
              },
              child: const Text('Take images from camera'),
            ),
          ],
        ));
  }
}
