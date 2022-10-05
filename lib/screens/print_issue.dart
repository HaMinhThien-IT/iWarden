import 'package:flutter/material.dart';
import 'package:iWarden/common/Customcheckbox.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/providers/print_issue_providers.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';
import 'package:provider/provider.dart';

class PrintIssue extends StatefulWidget {
  static const routeName = '/print-issue';
  const PrintIssue({super.key});

  @override
  State<PrintIssue> createState() => _PrintIssueState();
}

class _PrintIssueState extends State<PrintIssue> {
  bool _checked = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ar = Provider.of<PrintIssueProviders>(context);

    return Scaffold(
      appBar: const MyAppBar(
        title: "UKPC take picture",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        // width: double.infinity,
        margin: const EdgeInsets.only(bottom: ConstSpacing.bottom, top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "The following Photo are required",
                style: CustomTextStyle.h5.copyWith(color: ColorTheme.grey600),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => CustomCheckBox(
                      value: ar.listChecked[index],
                      onChanged: (val) {
                        ar.onChecked(val, index);
                      },
                      title: ar.data[index].title),
                  itemCount: ar.data.length,
                ),
              ),
            ]),
      ),
    );
  }
}
