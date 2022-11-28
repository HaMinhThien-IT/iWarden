library camera_picker;

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/picker_store.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/theme/text_theme.dart';
// ignore: depend_on_referenced_packages
import 'package:iWarden/common/IconButtonCamera/build_icon.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';

const _defaultPreviewHeight = 60.0;
const _defaultPreviewWidth = 80.0;

class CameraPicker extends HookWidget {
  final Function(dynamic error, dynamic stack)? onError;

  final ResolutionPreset resolutionPreset;

  final int? maxPicture;

  final int minPicture;

  final bool showCancelButton;

  final bool showTorchButton;

  final bool showSwitchCameraButton;

  final Color iconColor;

  final double previewHeight;

  final double previewWidth;

  final FutureOr<bool> Function(File file)? onDelete;

  final List<File>? initialFiles;

  final WidgetBuilder? noCameraBuilder;
  final String titleCamera;
  final bool? previewImage;
  final bool front;
  final bool editImage;
  const CameraPicker(
      {Key? key,
      this.initialFiles,
      this.previewHeight = _defaultPreviewHeight,
      this.previewWidth = _defaultPreviewWidth,
      this.noCameraBuilder,
      this.showSwitchCameraButton = true,
      this.onDelete,
      this.resolutionPreset = ResolutionPreset.high,
      this.iconColor = Colors.white,
      this.showTorchButton = true,
      this.showCancelButton = true,
      this.onError,
      this.maxPicture,
      this.minPicture = 1,
      this.front = false,
      this.previewImage = false,
      this.editImage = false,
      required this.titleCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => PickerStore(
        filesData: List.from(initialFiles ?? []),
        minPicture: minPicture,
        maxPicture: maxPicture));
    final availableCamerasFuture = useMemoized(() => availableCameras());
    final cameras = useState<List<CameraDescription>?>(null);
    final printIssue = Provider.of<PrintIssueProviders>(context);
    final widthScreen = MediaQuery.of(context).size.width;
    const padding = 30.0;
    bool isCamera = true;

    Future<void> showDiaLog(double widthScreen, double padding,
        BuildContext context, File img) async {
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Scaffold(
                appBar: const MyAppBar(
                  title: "UKPC take picture",
                  automaticallyImplyLeading: true,
                ),
                drawer: const MyDrawer(),
                bottomSheet: BottomSheet2(buttonList: [
                  BottomNavyBarItem(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset('assets/svg/IconDelete.svg'),
                    label: const Text(
                      'Delete',
                      style: CustomTextStyle.h6,
                    ),
                  ),
                  BottomNavyBarItem(
                    onPressed: () async {
                      if (printIssue.findIssueNoImage().id !=
                          printIssue.data.length) {
                        if (!editImage) {
                          await printIssue
                              .getIdIssue(printIssue.findIssueNoImage().id);
                          printIssue.addImageToIssue(printIssue.idIssue, img);
                          Navigator.of(context).pop();
                        } else {
                          printIssue.addImageToIssue(printIssue.idIssue, img);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      } else {
                        await printIssue
                            .getIdIssue(printIssue.findIssueNoImage().id);
                        printIssue.addImageToIssue(printIssue.idIssue, img);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    },
                    icon: SvgPicture.asset('assets/svg/IconComplete.svg'),
                    label: const Text(
                      'Accept',
                      style: CustomTextStyle.h6,
                    ),
                  ),
                ]),
                body: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          color: Colors.white,
                          child: Text(
                            "Please Accept or Delete the Photo",
                            style: CustomTextStyle.h5
                                .copyWith(color: ColorTheme.grey600),
                          ),
                        ),
                        Image.file(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ]),
                ));
          }).then((value) {
        if (isCamera == false) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ]);
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
            ),
          );
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorTheme.backdrop2,
            ),
          );
        }
      });
    }

    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ColoredBox(
          color: Colors.black,
          child: FutureBuilder<List<CameraDescription>>(
            builder: (context, snapshot) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (snapshot.connectionState == ConnectionState.done) {
                  cameras.value ??= snapshot.data ?? [];
                }
              });

              if (snapshot.connectionState == ConnectionState.waiting ||
                  cameras.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (cameras.value!.isEmpty) {
                return noCameraBuilder?.call(context) ??
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No camera available',
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Back'))
                        ],
                      ),
                    );
              }

              return HookBuilder(builder: (context) {
                final cameraControllerState = useState(CameraController(
                  cameras.value!.firstWhereOrNull((element) =>
                          element.lensDirection ==
                          (front
                              ? CameraLensDirection.front
                              : CameraLensDirection.back)) ??
                      cameras.value!.first,
                  resolutionPreset,
                  enableAudio: false,
                ));

                useEffect(() {
                  SystemChrome.setSystemUIOverlayStyle(
                    const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: ColorTheme.backdrop2,
                    ),
                  );
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);

                  return null;
                }, []);

                final cameraController = cameraControllerState.value;
                final initializeCamera = useMemoized(
                    () => cameraController.initialize(), [cameraController]);

                return WillPopScope(
                  onWillPop: () async {
                    cameraController.dispose();
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight
                    ]);
                    SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                    );
                    return true;
                  },
                  child: FutureBuilder(
                      future: initializeCamera,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return CameraPreview(
                          cameraController,
                          key: Key(cameraController.description.name),
                          child: SafeArea(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: ColorTheme.backdrop2,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: SvgPicture.asset(
                                            "assets/svg/IconBack.svg",
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        Text(
                                            !editImage
                                                ? printIssue
                                                    .findIssueNoImage()
                                                    .title
                                                : titleCamera,
                                            style: CustomTextStyle.h4
                                                .copyWith(color: Colors.white)),
                                      ],
                                    ),
                                    HookBuilder(builder: (context) {
                                      final mode = useState(FlashMode.auto);
                                      return InkWell(
                                        onTap: () {
                                          if (mode.value == FlashMode.auto) {
                                            mode.value = FlashMode.torch;
                                            cameraController
                                                .setFlashMode(FlashMode.torch);
                                          } else {
                                            mode.value = FlashMode.auto;
                                            cameraController
                                                .setFlashMode(FlashMode.auto);
                                          }
                                        },
                                        child: SvgPicture.asset(
                                            mode.value == FlashMode.auto
                                                ? "assets/svg/OffFlash.svg"
                                                : "assets/svg/OnFlash.svg"),
                                      );
                                    })
                                  ],
                                ),
                              ),
                              if (previewImage == false)
                                HookBuilder(builder: (context) {
                                  useListenable(store);
                                  return ImagesPreview(
                                    files: store.filesData,
                                    iconColor: iconColor,
                                    borderColor: iconColor,
                                    previewWidth: previewWidth,
                                    previewHeight: previewHeight,
                                    onDelete: (index) async {
                                      if (onDelete == null ||
                                          await onDelete!(
                                              store.filesData[index])) {
                                        store
                                            .removeFile(store.filesData[index]);
                                      }
                                    },
                                  );
                                }),
                              Container(
                                color: ColorTheme.backdrop2,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 70),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cameraController.dispose();
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitUp,
                                          DeviceOrientation.portraitDown,
                                          DeviceOrientation.landscapeLeft,
                                          DeviceOrientation.landscapeRight
                                        ]);
                                        SystemChrome.setSystemUIOverlayStyle(
                                          const SystemUiOverlayStyle(
                                            statusBarColor: Colors.transparent,
                                            statusBarIconBrightness:
                                                Brightness.dark,
                                          ),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: const BuildIcon(
                                        width: 32,
                                        height: 32,
                                        assetIcon:
                                            "assets/svg/IconCloseCamera.svg",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        try {
                                          final file = await cameraController
                                              .takePicture();
                                          log(file.path.toString());
                                          final tempDir = await syspaths
                                              .getTemporaryDirectory();
                                          final fileName =
                                              path.basename(file.path);
                                          File files = await File(
                                                  '${tempDir.path}/$fileName')
                                              .create();
                                          var decodeImg = img.decodeImage(
                                              await file.readAsBytes());
                                          img.Image fixed =
                                              img.copyRotate(decodeImg!, -90);
                                          var encodeImage = img.encodeJpg(fixed,
                                              quality: 100);
                                          var finalImage = files
                                            ..writeAsBytesSync(encodeImage);
                                          store.addFile(finalImage);
                                          previewImage == true
                                              ? SystemChrome
                                                  .setPreferredOrientations([
                                                  DeviceOrientation.portraitUp,
                                                  DeviceOrientation
                                                      .portraitDown,
                                                  DeviceOrientation
                                                      .landscapeLeft,
                                                  DeviceOrientation
                                                      .landscapeRight
                                                ])
                                              : null;
                                          previewImage == true
                                              ? SystemChrome
                                                  .setSystemUIOverlayStyle(
                                                  const SystemUiOverlayStyle(
                                                    statusBarColor:
                                                        Colors.transparent,
                                                    statusBarIconBrightness:
                                                        Brightness.dark,
                                                  ),
                                                )
                                              : null;
                                          previewImage == true
                                              // ignore: use_build_context_synchronously
                                              ? showDiaLog(widthScreen, padding,
                                                  context, finalImage)
                                              : null;
                                        } catch (ex, stack) {
                                          onError?.call(ex, stack);
                                        }
                                      },
                                      child: const BuildIcon(
                                        width: 64,
                                        height: 64,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.2),
                                        assetIcon: "assets/svg/IconCamera2.svg",
                                      ),
                                    ),
                                    HookBuilder(builder: (context) {
                                      useListenable(store);

                                      return InkWell(
                                        onTap: store.canContinue
                                            ? () {
                                                cameraController.dispose();
                                                Navigator.of(context)
                                                    .pop(store.filesData);
                                                SystemChrome
                                                    .setPreferredOrientations([
                                                  DeviceOrientation.portraitUp,
                                                  DeviceOrientation
                                                      .portraitDown,
                                                  DeviceOrientation
                                                      .landscapeLeft,
                                                  DeviceOrientation
                                                      .landscapeRight
                                                ]);
                                                SystemChrome
                                                    .setSystemUIOverlayStyle(
                                                  const SystemUiOverlayStyle(
                                                    statusBarColor:
                                                        Colors.transparent,
                                                    statusBarIconBrightness:
                                                        Brightness.dark,
                                                  ),
                                                );
                                              }
                                            : null,
                                        enableFeedback: true,
                                        child: const BuildIcon(
                                          width: 32,
                                          height: 32,
                                          assetIcon: "assets/svg/IconCom.svg",
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              )
                            ],
                          )),
                        );
                      }),
                );
              });
            },
            future: availableCamerasFuture,
          ),
        ),
      ),
    );
  }
}

/// ImagesPreview is a widget to show preview of files with
class ImagesPreview extends HookWidget {
  /// Files to show in preview
  final List<File> files;

  /// Callback when delete button is pressed, but don't delete the file, that's on you to so it and update [files]
  final Function(int index)? onDelete;

  /// Height of the preview, default to 60
  final double previewHeight;

  /// Widget of the preview, default to 80
  final double previewWidth;

  /// Icon color
  final Color iconColor;

  /// Border color
  final Color borderColor;

  const ImagesPreview({
    Key? key,
    this.previewHeight = _defaultPreviewHeight,
    this.previewWidth = _defaultPreviewWidth,
    this.iconColor = Colors.white,
    this.borderColor = Colors.white,
    this.onDelete,
    required this.files,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ioFiles = useMemoized(
        () => files.map((e) => File(e.path)).toList(), [files, files.length]);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < ioFiles.length; i++)
            ImagePreview(
              file: ioFiles[i],
              previewHeight: previewHeight,
              previewWidth: previewWidth,
              borderColor: borderColor,
              iconColor: iconColor,
              onDelete: onDelete == null
                  ? null
                  : () {
                      onDelete?.call(i);
                    },
            ),
        ],
      ),
    );
  }
}

/// Preview on one single image use in [ImagePreviews]
class ImagePreview extends StatelessWidget {
  // File to preview
  final File file;

  /// Border color of the preview
  final Color borderColor;

  /// Icon color of the preview
  final Color iconColor;

  /// Delete button pressed callback, delegate the actual deletion to you
  final VoidCallback? onDelete;

  /// Height of the preview, default to 60
  final double previewHeight;

  /// Widget of the preview, default to 80
  final double previewWidth;

  const ImagePreview(
      {Key? key,
      this.previewHeight = 60,
      this.previewWidth = 80,
      this.onDelete,
      required this.file,
      this.iconColor = Colors.white,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight / 1.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: borderColor)),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Stack(
                  children: [
                    Image.file(
                      file,
                      height: previewHeight,
                      width: previewWidth,
                      fit: BoxFit.cover,
                    ),
                    if (onDelete != null)
                      Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          onPressed: onDelete,
                          color: iconColor,
                          iconSize: 18,
                          tooltip: MaterialLocalizations.of(context)
                              .deleteButtonTooltip,
                          icon: const Icon(Icons.cancel),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
