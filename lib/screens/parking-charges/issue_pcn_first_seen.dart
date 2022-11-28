import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/button_radio.dart';
import 'package:iWarden/common/button_scan.dart';
import 'package:iWarden/common/drop_down_button.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/common/toast.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/controllers/contravention_controller.dart';
import 'package:iWarden/helpers/debouncer.dart';
import 'package:iWarden/models/ContraventionService.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/providers/contraventions.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_detail.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/screens/parking-charges/print_pcn.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

class IssuePCNFirstSeenScreen extends StatefulWidget {
  static const routeName = '/issue-pcn';

  const IssuePCNFirstSeenScreen({Key? key}) : super(key: key);

  @override
  State<IssuePCNFirstSeenScreen> createState() =>
      _IssuePCNFirstSeenScreenState();
}

class _IssuePCNFirstSeenScreenState extends State<IssuePCNFirstSeenScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnylineService _anylineService;
  final TextEditingController _vrnController = TextEditingController();
  final TextEditingController _vehicleMakeController = TextEditingController();
  final TextEditingController _vehicleColorController = TextEditingController();
  final TextEditingController _contraventionReasonController =
      TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  List<ContraventionReasonTranslations> contraventionReasonList = [];
  int selectedButton = 0;
  List<File> arrayImage = [];
  List<EvidencePhoto> evidencePhotoList = [];
  final _debouncer = Debouncer(milliseconds: 500);

  void getContraventionReasonListFrProvider(
      Contraventions contraventionProvider) async {
    await contraventionProvider.getContraventionReasonList().then((value) {
      setState(() {
        contraventionReasonList = value;
      });
    });
  }

  void onSearchVehicleInfoByPlate(String plate) {
    contraventionController.getVehicleDetailByPlate(plate: plate).then((value) {
      setState(() {
        _vehicleMakeController.text = value['make'] ?? '';
        _vehicleColorController.text = value['colour'] ?? '';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _anylineService = AnylineServiceImpl();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final contraventionProvider =
          Provider.of<Contraventions>(context, listen: false);
      getContraventionReasonListFrProvider(contraventionProvider);
      final args = ModalRoute.of(context)!.settings.arguments as dynamic;
      _vrnController.text = args != null ? args.Plate : '';
      if (args != null) {
        onSearchVehicleInfoByPlate(args.Plate);
      }
    });
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
    _vehicleMakeController.dispose();
    _vehicleColorController.dispose();
    _commentController.dispose();
    _contraventionReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<Locations>(context);
    var rng = Random();
    var anyNumber = rng.nextInt(900) + 100;
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;

    ContraventionCreateWardenCommand pcn = ContraventionCreateWardenCommand(
      ExternalReference: locationProvider.zone!.ExternalReference,
      ContraventionReference: '1234567890$anyNumber',
      Plate: _vrnController.text,
      VehicleMake: _vehicleMakeController.text,
      VehicleColour: _vehicleColorController.text,
      ContraventionReasonCode: _contraventionReasonController.text,
      EventDateTime: DateTime.now(),
      FirstObservedDateTime: args != null ? args.Created : DateTime.now(),
      WardenId: 1, // missing
      Longitude: 16, // missing
      Latitude: 10, // missing
      WardenComments:
          _commentController.text == '' ? ' ' : _commentController.text,
      BadgeNumber: 'test',
      LocationAccuracy: 0,
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

    Future<void> createPCN() async {
      final isValid = _formKey.currentState!.validate();
      anyNumber = rng.nextInt(900) + 100;
      pcn.ContraventionReference = '1234567890$anyNumber';
      Contravention? contravention;
      bool check = false;

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
        return;
      }
      if (!isValid) {
        return;
      } else {
        showLoading();
      }
      try {
        await contraventionController.createPCN(pcn).then((value) {
          contravention = value;
        });
        if (arrayImage.isNotEmpty) {
          for (int i = 0; i < arrayImage.length; i++) {
            await contraventionController.uploadContraventionImage(
              ContraventionCreatePhoto(
                contraventionReference: pcn.ContraventionReference,
                originalFileName: arrayImage[i].path.split('/').last,
                capturedDateTime: DateTime.now(),
                file: arrayImage[i],
              ),
            );
            if (i == arrayImage.length - 1) {
              check = true;
            }
          }
        }
        if (contravention != null && check == true) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pushNamed(PrintPCN.routeName, arguments: contravention);
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
        return;
      }

      _formKey.currentState!.save();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: MyAppBar(
            title: "Issue PCN",
            automaticallyImplyLeading: true,
            onRedirect: () {
              Navigator.of(context)
                  .popAndPushNamed(ParkingChargeList.routeName);
            },
          ),
          drawer: const MyDrawer(),
          bottomSheet: BottomSheet2(
            buttonList: [
              if (selectedButton == 1)
                BottomNavyBarItem(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ParkingChargeDetail.routeName);
                  },
                  icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
                  label: const Text(
                    'Complete',
                    style: CustomTextStyle.h6,
                  ),
                ),
              if (selectedButton == 0)
                BottomNavyBarItem(
                  onPressed: () async {
                    // Navigator.of(context).pushNamed(PrintPCN.routeName);
                    createPCN();
                  },
                  icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
                  label: const Text(
                    'Save & print PCN',
                    style: CustomTextStyle.h6,
                  ),
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: ConstSpacing.bottom + 20, top: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 24, 12, 10),
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
                                  onChanged: (value) {
                                    _debouncer.run(() {
                                      onSearchVehicleInfoByPlate(value);
                                    });
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
                            style: CustomTextStyle.h5,
                            controller: _vehicleMakeController,
                            decoration: const InputDecoration(
                              label: LabelRequire(labelText: "Vehicle make"),
                              hintText: "Enter vehicle make",
                            ),
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'Please enter vehicle make';
                              }
                              return null;
                            }),
                            onSaved: (value) {
                              _vehicleMakeController.text = value as String;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            style: CustomTextStyle.h5,
                            controller: _vehicleColorController,
                            decoration: const InputDecoration(
                              label: LabelRequire(labelText: "Vehicle color"),
                              hintText: "Enter vehicle color",
                            ),
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'Please enter vehicle color';
                              }
                              return null;
                            }),
                            onSaved: (value) {
                              _vehicleColorController.text = value as String;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            child: DropDownButtonWidget(
                              labelText: const LabelRequire(
                                labelText: 'Contravention',
                              ),
                              hintText: 'Select contravention',
                              item: contraventionReasonList
                                  .map(
                                    (itemValue) => DropdownMenuItem(
                                      value:
                                          itemValue.contraventionReason!.code,
                                      child: Text(
                                        itemValue.summary as String,
                                        style: CustomTextStyle.h5,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onchanged: (value) {
                                setState(() {
                                  _contraventionReasonController.text =
                                      value as String;
                                });
                              },
                              value:
                                  _contraventionReasonController.text.isNotEmpty
                                      ? _contraventionReasonController.text
                                      : null,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(7, 16, 16, 4),
                            decoration: BoxDecoration(
                                color: ColorTheme.lighterPrimary,
                                borderRadius: BorderRadius.circular(3)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    "Please select type of PCN",
                                    style: CustomTextStyle.h6,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: OptionRadio(
                                          text: 'Physical PCN',
                                          index: 0,
                                          selectedButton: selectedButton,
                                          press: (val) {
                                            selectedButton = val;
                                            setState(() {});
                                          }),
                                    ),
                                    Expanded(
                                      child: OptionRadio(
                                          text: 'Virtual PCN',
                                          index: 1,
                                          selectedButton: selectedButton,
                                          press: (val) {
                                            selectedButton = val;
                                            setState(() {});
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _commentController,
                            style: CustomTextStyle.h6,
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              labelText: "Comment",
                              hintText: "Enter comment",
                            ),
                            onSaved: (value) {
                              _commentController.text = value as String;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  AddImage(
                    onAddImage: () async {
                      final results =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CameraPicker(
                                    titleCamera: "Issue parking charge",
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
                    listImage: arrayImage,
                    isCamera: true,
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
