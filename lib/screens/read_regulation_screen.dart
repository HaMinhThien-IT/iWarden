import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/common/custom_checkbox.dart';
import 'package:iWarden/common/toast.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

class ReadRegulationScreen extends StatefulWidget {
  static const routeName = '/read-regulation';
  const ReadRegulationScreen({super.key});

  @override
  State<ReadRegulationScreen> createState() => _ReadRegulationScreenState();
}

class _ReadRegulationScreenState extends State<ReadRegulationScreen> {
  bool checkbox = false;
  void checkNextPage() {
    if (!checkbox) {
      CherryToast.error(
        displayCloseButton: false,
        title: Text(
          'Please tick to confirm and go next',
          style: CustomTextStyle.h5.copyWith(color: ColorTheme.danger),
        ),
        toastPosition: Position.bottom,
        borderRadius: 5,
      ).show(context);
    } else {
      Navigator.of(context).pushNamed(HomeOverview.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        height: 42,
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: checkNextPage,
          icon: SvgPicture.asset('assets/svg/IconNextBottom.svg'),
          label: Text(
            'Check in',
            style: CustomTextStyle.h6.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Please read below and confirm that you understand all regulations of this location.",
                      style: CustomTextStyle.h5
                          .copyWith(color: ColorTheme.primary),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: CustomTextStyle.h5,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: CustomCheckBox(
                  value: checkbox,
                  onChanged: (val) {
                    setState(() {
                      checkbox = val;
                    });
                  },
                  title:
                      "I confirm that I already read and \n understood every regulations.",
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
