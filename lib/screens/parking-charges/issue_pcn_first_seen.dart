import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/button_radio.dart';
import 'package:iWarden/common/button_scan.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/common/slider_image.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/screens/map-screen/map_screen.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_detail.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

class IssuePCNFirstSeenScreen extends StatefulWidget {
  static const routeName = '/issue-pcn';

  const IssuePCNFirstSeenScreen({Key? key}) : super(key: key);

  @override
  State<IssuePCNFirstSeenScreen> createState() =>
      _IssuePCNFirstSeenScreenState();
}

class _IssuePCNFirstSeenScreenState extends State<IssuePCNFirstSeenScreen> {
  final TextEditingController _locationController = TextEditingController();
  late AnylineService _anylineService;
  final TextEditingController vrnText = TextEditingController();
  @override
  void initState() {
    _anylineService = AnylineServiceImpl();
    super.initState();
  }

  List<File> arrayImage = [];
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
          vrnText.text = resultText.substring(0, resultText.length - 1);
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

  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    SingingCharacter? character = SingingCharacter.lafayette;
    return Scaffold(
        appBar: const MyAppBar(
            title: "Issue parking charge", automaticallyImplyLeading: true),
        drawer: const MyDrawer(),
        bottomSheet: BottomSheet2(buttonList: [
          if (selectedButton == 0)
            BottomNavyBarItem(
              onPressed: () {
                Navigator.of(context).pushNamed(ParkingChargeDetail.routeName);
              },
              icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
              label: const Text(
                'Complete',
                style: CustomTextStyle.h6,
              ),
            ),
          if (selectedButton == 1)
            BottomNavyBarItem(
              onPressed: () {
                Navigator.of(context).pushNamed(ParkingChargeDetail.routeName);
              },
              icon: SvgPicture.asset('assets/svg/IconComplete2.svg'),
              label: const Text(
                'Save & print PCN',
                style: CustomTextStyle.h6,
              ),
            ),
        ]),
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 8,
                              child: TextFormField(
                                  controller: vrnText,
                                  style: CustomTextStyle.h5,
                                  decoration: const InputDecoration(
                                    label: LabelRequire(labelText: "VRN"),
                                    hintText: "Enter VRN",
                                  )),
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
                        Consumer<Locations>(
                          builder: ((_, location, child) {
                            return AutoCompleteWidget(
                              labelText:
                                  const LabelRequire(labelText: "Vehicle make"),
                              hintText: 'Enter vehicle make',
                              controller: _locationController,
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  _locationController.text =
                                      (suggestion as Location).value;
                                });
                              },
                              itemBuilder: (context, locationItem) {
                                return ItemDataComplete(
                                  itemData: (locationItem as Location).label,
                                );
                              },
                              suggestionsCallback: (pattern) {
                                return location.onSuggest(pattern);
                              },
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Consumer<Locations>(
                          builder: ((_, location, child) {
                            return AutoCompleteWidget(
                              labelText: const LabelRequire(
                                  labelText: "Vehicle model"),
                              hintText: 'Enter vehicle model',
                              controller: _locationController,
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  _locationController.text =
                                      (suggestion as Location).value;
                                });
                              },
                              itemBuilder: (context, locationItem) {
                                return ItemDataComplete(
                                  itemData: (locationItem as Location).label,
                                );
                              },
                              suggestionsCallback: (pattern) {
                                return location.onSuggest(pattern);
                              },
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Consumer<Locations>(
                          builder: ((_, location, child) {
                            return AutoCompleteWidget(
                              labelText: const LabelRequire(
                                  labelText: "Vehicle color"),
                              hintText: 'Enter vehicle color',
                              controller: _locationController,
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  _locationController.text =
                                      (suggestion as Location).value;
                                });
                              },
                              itemBuilder: (context, locationItem) {
                                return ItemDataComplete(
                                  itemData: (locationItem as Location).label,
                                );
                              },
                              suggestionsCallback: (pattern) {
                                return location.onSuggest(pattern);
                              },
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Consumer<Locations>(
                          builder: ((_, location, child) {
                            return AutoCompleteWidget(
                              labelText: const Text("Contravention"),
                              hintText: 'Overstaying time',
                              controller: _locationController,
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  _locationController.text =
                                      (suggestion as Location).value;
                                });
                              },
                              itemBuilder: (context, locationItem) {
                                return ItemDataComplete(
                                  itemData: (locationItem as Location).label,
                                );
                              },
                              suggestionsCallback: (pattern) {
                                return location.onSuggest(pattern);
                              },
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
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
                            style: CustomTextStyle.h6,
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              labelText: "Comment",
                              hintText: "Enter bay comment",
                            )),
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
                    isCamera: true),
              ],
            ),
          ),
        ));
  }
}
