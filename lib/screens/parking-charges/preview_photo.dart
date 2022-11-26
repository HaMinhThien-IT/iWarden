import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/preview_image_item.dart';
import 'package:provider/provider.dart';

class PreviewPhoto extends StatelessWidget {
  static const routeName = '/preview-photo';

  const PreviewPhoto({super.key});
  @override
  Widget build(BuildContext context) {
    final printIssue = Provider.of<PrintIssueProviders>(context);
    void editPhotoIssue(int id, String title) {
      printIssue.getIdIssue(id);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraPicker(
            titleCamera: title,
            previewImage: true,
            editImage: true,
            onDelete: (file) {
              return true;
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const MyAppBar(
        title: "Preview",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: printIssue.data
                .map((e) => PreviewImageItem(
                    title: e.title,
                    image: e.image != null ? File(e.image!.path) : null,
                    func: () => editPhotoIssue(e.id, e.title)))
                .toList(),
          ),
        ),
      ),
    );
  }
}
