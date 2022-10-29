import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/autocomplete.dart';
import 'package:iWarden/common/drop_down_button.dart';
import 'package:iWarden/common/label_require.dart';
import 'package:iWarden/models/date_filter.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:iWarden/widgets/statistic/statistic_item.dart';

class StatisticScreen extends StatefulWidget {
  static const routeName = '/statictis';
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
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

  final dataList = DataDateFilter().data.toList();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Widget listDevice = Container(
      height: 56,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
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
            listDevice,
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.width < 450
                  ? MediaQuery.of(context).size.height - (58 + 8 + 16 + 55 + 24)
                  : null,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("My statistic"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: StatisticItem(
                          assetIcon: "assets/svg/IconFirstSeen.svg",
                          background: ColorTheme.lighterPrimary,
                          quantity: 100,
                          title: "First seen",
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Expanded(
                        child: StatisticItem(
                          assetIcon: "assets/svg/IconGrace.svg",
                          background: ColorTheme.lightDanger,
                          quantity: 100,
                          title: "Grace period",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: StatisticItem(
                  //         assetIcon: "assets/svg/IconParkingChargesHome.svg",
                  //         background: ColorTheme.lighterSecondary,
                  //         quantity: 100,
                  //         title: "First seen",
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 32,
                  //     ),
                  //     const Expanded(
                  //       child: StatisticItem(
                  //         assetIcon: "assets/svg/IconWarning.svg",
                  //         background: ColorTheme.grey200,
                  //         quantity: 100,
                  //         title: "Aborted PCN",
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownButtonWidget(
                    hintText: 'Date filter',
                    // item: dataList
                    //     .map(
                    //       (itemValue) => DropdownMenuItem(
                    //         value: itemValue.value,
                    //         child: Text(itemValue.label),
                    //       ),
                    //     )
                    //     .toList(),
                    item: DropdownMenuItem2().addDividersAfterItems(dataList),
                    onchanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    value: selectedValue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
