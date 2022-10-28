import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class StatictisScreen extends StatefulWidget {
  static const routeName = '/statictis';
  const StatictisScreen({super.key});

  @override
  State<StatictisScreen> createState() => _StatictisScreenState();
}

class _StatictisScreenState extends State<StatictisScreen> {
  final TextEditingController _locationController = TextEditingController();

  _buildDevice(String nameDevice, bool stateDevice) {
    return Row(
      children: [
        SvgPicture.asset(stateDevice
            ? "assets/svg/IconCompleteActive.svg"
            : "assets/svg/IconDotCom.svg"),
        const SizedBox(
          width: 4,
        ),
        Text(
          nameDevice,
          style: CustomTextStyle.caption,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Statistics",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDevice("GPS", true),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildDevice("Bluetooth", true),
                        // _buildDevice("Network status", false),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDevice("Network status", false),
                        const SizedBox(
                          height: 8,
                        ),
                        _buildDevice("Camera", true),
                        // _buildDevice("Network status", false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("My statistic"),
                      // AutoCompleteWidget(
                      //   labelText:
                      //       const LabelRequire(labelText: "Vehicle make"),
                      //   hintText: 'Enter vehicle make',
                      //   controller: _locationController,
                      //   onSuggestionSelected: (suggestion) {
                      //     setState(() {
                      //       // _locationController.text =
                      //       //     (suggestion as Location).value;
                      //     });
                      //   },
                      //   itemBuilder: (context, locationItem) {
                      //     return ItemDataComplete(
                      //       itemData: "a",
                      //     );
                      //   },
                      //   suggestionsCallback: (pattern) {
                      //     // return location.onSuggest(pattern);
                      //   },
                      // )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
