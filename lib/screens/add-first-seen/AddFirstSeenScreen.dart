import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/common/Autocomplete.dart';
import 'package:iWarden/common/LabelRequire.dart';
import 'package:iWarden/common/ButtonScan.dart';
import 'package:iWarden/common/ToastSuccess.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/Location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddFirstSeenScreen extends StatefulWidget {
  static const routeName = '/add-first-seen';
  const AddFirstSeenScreen({super.key});

  @override
  State<AddFirstSeenScreen> createState() => _AddFirstSeenScreenState();
}

class _AddFirstSeenScreenState extends State<AddFirstSeenScreen> {
  late FToast fToast;
  final TextEditingController _locationController = TextEditingController();
  late AnylineService _anylineService;
  final TextEditingController vrnText = TextEditingController();
  @override
  void initState() {
    super.initState();
    fToast = FToast();
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

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    const padding = 30.0;

    fToast.init(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: "Add first seen",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: ColorTheme.grey300),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ((widthScreen / 2) - padding) - 12,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/IconCar.svg"),
                    label: const Text(
                      "First seen list",
                      style: CustomTextStyle.h6,
                    )),
              ),
              Container(
                height: 25,
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      width: 0.5,
                      color: ColorTheme.grey300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ((widthScreen / 2) - padding) - 12,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/IconSave.svg"),
                  label: const Text(
                    "Save",
                    style: CustomTextStyle.h6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
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
                                // initialValue: vrnText.text,
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
                            labelText:
                                const LabelRequire(labelText: "Vehicle model"),
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
                            labelText:
                                const LabelRequire(labelText: "Vehicle color"),
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
                      TextFormField(
                          style: CustomTextStyle.h6,
                          decoration: const InputDecoration(
                            label: LabelRequire(labelText: "Bay number"),
                            hintText: "Enter bay number",
                          )),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              const AddImage(
                titleCamera: "Add first seen",
              )
            ],
          ),
        ),
      ),
    );
  }
}
