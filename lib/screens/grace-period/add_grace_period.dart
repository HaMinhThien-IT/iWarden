import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/common/button_scan.dart';
import 'package:iWarden/common/toast.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/controllers/evidence_photo_controller.dart';
import 'package:iWarden/controllers/vehicle_information_controller.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

class AddGracePeriod extends StatefulWidget {
  static const routeName = '/add-grace-period';
  const AddGracePeriod({super.key});

  @override
  State<AddGracePeriod> createState() => _AddGracePeriodState();
}

class _AddGracePeriodState extends State<AddGracePeriod> {
  late AnylineService _anylineService;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _vrnController = TextEditingController();
  final TextEditingController _bayNumberController = TextEditingController();
  List<File> arrayImage = [];
  List<EvidencePhoto> evidencePhotoList = [];
  final vehicleInfoController = VehicleInfoController();
  final evidencePhotoController = EvidencePhotoController();

  @override
  void initState() {
    super.initState();
    _anylineService = AnylineServiceImpl();
  }

  Future<void> scan(ScanMode mode) async {
    try {
      Result? result = await _anylineService.scan(mode);
      if (result != null) {
        String resultText = result.jsonMap!.values
            .take(2)
            .toString()
            .split(',')[1]
            .replaceAll(' ', '');
        setState(() {
          _vrnController.text = resultText.substring(0, resultText.length - 1);
        });
      }
    } catch (e, s) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          elevation: 0,
          title: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Error',
            ),
          ),
          content: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              '$e, $s',
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _vrnController.dispose();
    _bayNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<Locations>(context);

    VehicleInformation vehicleInfo = VehicleInformation(
      ExpiredAt: DateTime.now().add(
        Duration(
          seconds: locationProvider.expiringTime,
        ),
      ),
      Plate: _vrnController.text,
      ZoneId: locationProvider.zone!.Id as int,
      LocationId: locationProvider.location!.Id as int,
      BayNumber: _bayNumberController.text,
      Type: VehicleInformationType.GRACE_PERIOD.index,
      Latitude: 16,
      Longitude: 10,
      CarLeft: false,
      EvidencePhotos: evidencePhotoList,
    );

    void showLoading() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Future<bool> saveForm() async {
      final isValid = _formKey.currentState!.validate();
      bool check = false;
      setState(() {
        evidencePhotoList.clear();
      });
      if (arrayImage.isEmpty) {
        CherryToast.error(
          displayCloseButton: false,
          title: Text(
            'Please take at least 1 picture',
            style: CustomTextStyle.h5.copyWith(color: ColorTheme.danger),
          ),
          toastPosition: Position.bottom,
          borderRadius: 5,
        ).show(context);
        return false;
      }
      if (!isValid) {
        return false;
      } else {
        showLoading();
      }
      try {
        if (arrayImage.isNotEmpty) {
          for (int i = 0; i < arrayImage.length; i++) {
            await evidencePhotoController
                .uploadImage(arrayImage[i])
                .then((value) {
              evidencePhotoList.add(EvidencePhoto(BlobName: value['blobName']));
            });
          }
        }

        await vehicleInfoController
            .upsertVehicleInfo(vehicleInfo)
            .then((value) {
          check = true;
        });

        if (check == true) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          // ignore: use_build_context_synchronously
          CherryToast.success(
            displayCloseButton: false,
            title: Text(
              'Add successfully!',
              style: CustomTextStyle.h5.copyWith(color: ColorTheme.success),
            ),
            toastPosition: Position.bottom,
            borderRadius: 5,
          ).show(context);

          setState(() {
            _vrnController.text = '';
            _bayNumberController.text = '';
            arrayImage.clear();
            evidencePhotoList.clear();
          });
        }
      } catch (error) {
        Navigator.of(context).pop();
        // ignore: use_build_context_synchronously
        CherryToast.error(
          displayCloseButton: false,
          title: Text(
            'Error creating! Please try again!',
            style: CustomTextStyle.h5.copyWith(color: ColorTheme.danger),
          ),
          toastPosition: Position.bottom,
          borderRadius: 5,
        ).show(context);
        return false;
      }

      _formKey.currentState!.save();
      return true;
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MyAppBar(
          title: "Add Consideration Period ",
          automaticallyImplyLeading: true,
          onRedirect: () {
            Navigator.of(context).popAndPushNamed(GracePeriodList.routeName);
          },
        ),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(buttonList: [
          BottomNavyBarItem(
            onPressed: () async {
              await saveForm().then((value) {
                if (value == true) {
                  Navigator.of(context)
                      .popAndPushNamed(GracePeriodList.routeName);
                  CherryToast.success(
                    displayCloseButton: false,
                    title: Text(
                      'Add successfully!',
                      style: CustomTextStyle.h5
                          .copyWith(color: ColorTheme.success),
                    ),
                    toastPosition: Position.bottom,
                    borderRadius: 5,
                  ).show(context);
                }
              });
            },
            icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
            label: const Text(
              'Complete',
              style: CustomTextStyle.h6,
            ),
          ),
          BottomNavyBarItem(
            onPressed: saveForm,
            icon: SvgPicture.asset('assets/svg/IconSave.svg'),
            label: const Text(
              'Save & add',
              style: CustomTextStyle.h6,
            ),
          ),
        ]),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 24,
                    ),
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex: 8,
                                child: TextFormField(
                                  controller: _vrnController,
                                  style: CustomTextStyle.h5,
                                  decoration: const InputDecoration(
                                    label: LabelRequire(labelText: "VRN"),
                                    hintText: "Enter VRN",
                                  ),
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter VRN';
                                    }
                                    return null;
                                  }),
                                  onSaved: (value) {
                                    _vrnController.text = value as String;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: ButtonScan(
                                  onTap: () {
                                    scan(ScanMode.LicensePlate);
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            style: CustomTextStyle.h6,
                            decoration: const InputDecoration(
                              labelText: 'Bay number',
                              hintText: "Enter bay number",
                            ),
                            controller: _bayNumberController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddImage(
                    isCamera: true,
                    listImage: arrayImage,
                    onAddImage: () async {
                      final results =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CameraPicker(
                                    titleCamera: "Add grace period",
                                    onDelete: (file) {
                                      return true;
                                    },
                                  )));
                      if (results != null) {
                        setState(() {
                          arrayImage = List.from(results);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
