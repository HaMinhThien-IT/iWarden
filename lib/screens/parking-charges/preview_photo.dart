import 'package:flutter/material.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/parking-charge/preview_image_item.dart';

class PreviewPhoto extends StatelessWidget {
  static const routeName = '/preview-photo';
  const PreviewPhoto({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [0, 1, 2, 3, 4, 5]
                .map((e) => const PreviewImageItem())
                .toList(),
          ),
        ),
      ),
    );
  }
}
