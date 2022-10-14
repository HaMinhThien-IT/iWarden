import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/common/button_scan.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

class AddFirstSeenScreen extends StatefulWidget {
  static const routeName = '/add-first-seen';
  const AddFirstSeenScreen({super.key});

  @override
  State<AddFirstSeenScreen> createState() => _AddFirstSeenScreenState();
}

class _AddFirstSeenScreenState extends State<AddFirstSeenScreen> {
  late AnylineService _anylineService;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final vrnText = TextEditingController();
  final _locationController = TextEditingController();

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

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Add first seen",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
          onPressed: _saveForm,
          icon: SvgPicture.asset('assets/svg/IconSave.svg'),
          label: const Text(
            'Save',
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
            margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
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
                                controller: vrnText,
                                style: CustomTextStyle.h5,
                                decoration: const InputDecoration(
                                  label: LabelRequire(labelText: "VRN"),
                                  hintText: "Enter VRN",
                                ),
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return 'VRN is required.';
                                  }
                                  return null;
                                }),
                                onSaved: (value) {
                                  vrnText.text = value as String;
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
                        Consumer<Locations>(
                          builder: ((_, location, child) {
                            return AutoCompleteWidget(
                              labelText: const LabelRequire(
                                labelText: "Vehicle make",
                              ),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Vehicle make is required.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _locationController.text = value as String;
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Vehicle model is required.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _locationController.text = value as String;
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
                                labelText: "Vehicle color",
                              ),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Vehicle color is required.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _locationController.text = value as String;
                              },
                            );
                          }),
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
                        ),
                      ],
                    ),
                  ),
                ),
                const AddImage(
                  titleCamera: "Add first seen",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
