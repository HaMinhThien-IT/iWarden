import 'package:flutter/material.dart';
import 'package:iWarden/common/AddImage.dart';
import 'package:iWarden/common/Autocomplete.dart';
import 'package:iWarden/common/ButtonScan.dart';
import 'package:iWarden/common/LabelRequire.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/models/Location.dart';
import 'package:iWarden/providers/locations.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
            title: "Issue parking charge", automaticallyImplyLeading: true),
        drawer: const MyDrawer(),
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
                                  style: CustomTextStyle.h5,
                                  decoration: const InputDecoration(
                                    label: LabelRequire(labelText: "VRN"),
                                    hintText: "Enter VRN",
                                  )),
                            ),
                            Flexible(
                              flex: 2,
                              child: ButtonScan(
                                onTap: () {},
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
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                AddImage()
              ],
            ),
          ),
        ));
  }
}
