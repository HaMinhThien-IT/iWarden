import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/button_scan.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/common/slider_image.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/screens/abort-screen/abort_screen.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
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
    return Scaffold(
        appBar: const MyAppBar(
            title: "Issue parking charge", automaticallyImplyLeading: true),
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
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset("assets/svg/IconCanel.svg"),
                      label: const Text(
                        "Cancel",
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(AbortScreen.routeName);
                    },
                    icon: SvgPicture.asset(
                      "assets/svg/IconComplete.svg",
                      color: ColorTheme.success,
                    ),
                    label: const Text(
                      "Next",
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
            margin: const EdgeInsets.only(
                bottom: ConstSpacing.bottom + 20, top: 20),
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
                        TextFormField(
                            style: CustomTextStyle.h6,
                            decoration: const InputDecoration(
                              label: LabelRequire(labelText: "Bay number"),
                              hintText: "Enter bay number",
                            )),
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
                        TextFormField(
                            style: CustomTextStyle.h6,
                            keyboardType: TextInputType.multiline,
                            minLines: 2,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              labelText: "Comment",
                              hintText: "Enter bay comment",
                            )),
                      ],
                    ),
                  ),
                ),
                const SliderImage(),
              ],
            ),
          ),
        ));
  }
}
