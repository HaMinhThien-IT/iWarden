library camera_picker;

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iWarden/common/Camera/picker_store.dart';
import 'package:iWarden/helpers/FormatDate.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:image/image.dart' as img;

const _defaultPreviewHeight = 60.0;
const _defaultPreviewWidth = 80.0;

/// A CameraPicker.
class CameraPicker extends HookWidget {
  final Function(dynamic error, dynamic stack)? onError;

  /// Resolution preset of the camera
  final ResolutionPreset resolutionPreset;

  /// Max number of picture allowed, used to enable the continue button
  final int? maxPicture;

  /// Min number of picture allowed, used to enable the continue button
  final int minPicture;

  /// Show or not the cancel button
  final bool showCancelButton;

  /// Show or not the torch button
  final bool showTorchButton;

  /// Show or not the switch camera button
  final bool showSwitchCameraButton;

  /// Color to use for icons
  final Color iconColor;

  /// Height of the preview, default to 60
  final double previewHeight;

  /// Widget of the preview, default to 80
  final double previewWidth;

  /// Callback when an existing picture is asked to be delete, return true or false to continue deletion
  final FutureOr<bool> Function(File file)? onDelete;

  /// Initial selection of images to put in the preview
  final List<File>? initialFiles;

  /// Custom builder to show "no camera" widget
  final WidgetBuilder? noCameraBuilder;
  final String titleCamera;
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
                          element.lensDirection == CameraLensDirection.back) ??
                      cameras.value!.first,
                  resolutionPreset,
                  enableAudio: false,
                ));
                final isBackCamera = useState(true);
                final cameraController = cameraControllerState.value;
                final initializeCamera = useMemoized(
                    () => cameraController.initialize(), [cameraController]);

                return WillPopScope(
                  onWillPop: () async {
                    cameraController.dispose();
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
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                if (showTorchButton && isBackCamera.value)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: HookBuilder(builder: (context) {
                                      final mode = useState(FlashMode.auto);
                                      return IconButton(
                                        onPressed: () {
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
                                        icon: Icon(mode.value == FlashMode.auto
                                            ? Icons.flashlight_on_outlined
                                            : Icons.flashlight_on),
                                        color: iconColor,
                                      );
                                    }),
                                  ),
                                if (showSwitchCameraButton &&
                                    cameras.value!.length > 1)
                                  Positioned(
                                    top: 17,
                                    left: 15,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          '• ${titleCamera}',
                                          style: CustomTextStyle.body2.copyWith(
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
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
                                              store.removeFile(
                                                  store.filesData[index]);
                                            }
                                          },
                                        );
                                      }),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (showCancelButton)
                                            IconButton(
                                              onPressed: () {
                                                cameraController.dispose();
                                                Navigator.of(context).pop();
                                              },
                                              tooltip: MaterialLocalizations.of(
                                                      context)
                                                  .cancelButtonLabel,
                                              color: iconColor,
                                              enableFeedback: true,
                                              icon: const Icon(Icons.close),
                                            ),
                                          IconButton(
                                            onPressed: () async {
                                              try {
                                                final file =
                                                    await cameraController
                                                        .takePicture();
                                                final tempDir = await syspaths
                                                    .getTemporaryDirectory();
                                                final fileName =
                                                    path.basename(file.path);
                                                File files = await File(
                                                        '${tempDir.path}/${fileName}')
                                                    .create();

                                                var decodeImg = img.decodeImage(
                                                    await file.readAsBytes());

                                                img.Image fixed =
                                                    img.copyRotate(
                                                        decodeImg!, -90);
                                                img.drawString(
                                                    fixed,
                                                    img.arial_24,
                                                    1030,
                                                    680,
                                                    FormatDate().getLocalDate(
                                                        DateTime.now()));
                                                var encodeImage = img.encodeJpg(
                                                    fixed,
                                                    quality: 100);
                                                var finalImage = files
                                                  ..writeAsBytesSync(
                                                      encodeImage);
                                                store.addFile(finalImage);
                                              } catch (ex, stack) {
                                                onError?.call(ex, stack);
                                              }
                                            },
                                            enableFeedback: true,
                                            color: iconColor,
                                            iconSize: 40,
                                            icon: const Icon(
                                              Icons.photo_camera_outlined,
                                            ),
                                          ),
                                          HookBuilder(builder: (context) {
                                            useListenable(store);

                                            return IconButton(
                                              onPressed: store.canContinue
                                                  ? () {
                                                      cameraController
                                                          .dispose();
                                                      Navigator.of(context)
                                                          .pop(store.filesData);
                                                    }
                                                  : null,
                                              enableFeedback: true,
                                              tooltip: MaterialLocalizations.of(
                                                      context)
                                                  .okButtonLabel,
                                              icon: const Icon(Icons.check),
                                              disabledColor: Colors.grey[600],
                                              color: iconColor,
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    return Padding(
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
                    tooltip:
                        MaterialLocalizations.of(context).deleteButtonTooltip,
                    icon: const Icon(Icons.cancel),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
