import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _storedImage;
  List<File> arrayImage = [];
  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 600, imageQuality: 90);
    if (pickedImage == null) {
      return;
    }
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _storedImage = pickedImageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImageFile.path);
    final savedImage = await pickedImageFile.copy('${appDir.path}/$fileName');
    setState(() {
      arrayImage.add(savedImage);
    });
  }

  void remove(int index) {
    setState(() {
      arrayImage.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Images (${arrayImage.length})",
                style:
                    CustomTextStyle.h5.copyWith(color: ColorTheme.darkPrimary),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: _takePicture,
                    child: Container(
                      height: 56.0,
                      width: 56.0,
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColorTheme.grey200,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: SvgPicture.asset("assets/svg/IconCamera.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 56.0,
                        child: ListView.builder(
                          // clipBehavior: Clip.none,

                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: Image.file(
                                      arrayImage[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    remove(index);
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                        color: ColorTheme.grey400,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: SvgPicture.asset(
                                        "assets/svg/IconCannel.svg"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          itemCount: arrayImage.length,
                        )),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
