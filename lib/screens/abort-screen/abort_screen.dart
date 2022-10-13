import 'package:flutter/material.dart';
import 'package:iWarden/common/bottom_sheet.dart' as common;
import 'package:iWarden/common/bottom_sheet_2.dart';
import 'package:iWarden/common/custom_checkbox.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Abort {
  final String id;
  final String reason;
  Abort({required this.id, required this.reason});
}

class AbortScreen extends StatefulWidget {
  static const routeName = '/abort';
  const AbortScreen({super.key});

  @override
  State<AbortScreen> createState() => _AbortScreenState();
}

class _AbortScreenState extends State<AbortScreen> {
  final List<Abort> _reasonList = [
    Abort(id: '1', reason: 'Staff member'),
    Abort(id: '2', reason: 'Returned - drove off'),
    Abort(id: '3', reason: 'Returned -customer / Receipts'),
    Abort(id: '4', reason: 'Client request'),
    Abort(id: '5', reason: 'Car on white list'),
    Abort(id: '6', reason: 'Car has 7 unpaid charges'),
  ];
  late List<bool> isCheckedReason =
      List<bool>.filled(_reasonList.length, false);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    const padding = 30.0;
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Aborting',
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      bottomSheet: BottomSheet2(buttonList: [
        BottomNavyBarItem(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svg/IconCancel2.svg'),
          label: const Text(
            'Cancel',
            style: CustomTextStyle.h6,
          ),
        ),
        BottomNavyBarItem(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svg/IconFinish.svg'),
          label: const Text(
            'Finish abort',
            style: CustomTextStyle.h6,
          ),
        ),
      ]),
      body: Container(
        color: ColorTheme.white,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        height: heightScreen / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please select the reasons and submit to abort this parking charge.',
                style: CustomTextStyle.body1.copyWith(
                  color: ColorTheme.grey600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) {
                    return (CustomCheckBox(
                      value: isCheckedReason[i],
                      onChanged: (val) {
                        setState(() {
                          isCheckedReason[i] = val;
                        });
                      },
                      title: _reasonList[i].reason,
                    ));
                  },
                  itemCount: _reasonList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
