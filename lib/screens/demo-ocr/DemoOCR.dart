import 'package:flutter/material.dart';
import 'package:iWarden/common/ButtonScan.dart';
import 'package:iWarden/common/LabelRequire.dart';
import 'package:iWarden/screens/demo-ocr/anyline_service.dart';
import 'package:iWarden/screens/demo-ocr/result.dart';
import 'package:iWarden/screens/demo-ocr/scan_modes.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

enum FilterOptions {
  // ignore: constant_identifier_names
  licensePlate,
  // ignore: constant_identifier_names
  licensePlateUS,
  licensePlateAfr
}

class DemoOCR extends StatefulWidget {
  static const routeName = 'demo-ocr';
  const DemoOCR({super.key});

  @override
  State<DemoOCR> createState() => _DemoOCRState();
}

class _DemoOCRState extends State<DemoOCR> {
  late AnylineService _anylineService;

  @override
  void initState() {
    super.initState();
    _anylineService = AnylineServiceImpl();
  }

  Future<void> scan(ScanMode mode) async {
    try {
      Result? result = await _anylineService.scan(mode);
      if (result != null) {
        print(result.jsonMap![0].licensePlate as String);
      }
    } catch (e, s) {
      debugPrint('$e, $s');
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

  // _openResultDisplay(Result result) {
  //   Navigator.pushNamed(
  //       context,
  //       result.scanMode.isCompositeScan()
  //           ? CompositeResultDisplay.routeName
  //           : ResultDisplay.routeName,
  //       arguments: result);
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const MyAppBar(
        title: "Demo OCR",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          color: ColorTheme.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: TextFormField(
                    style: CustomTextStyle.h5,
                    decoration: const InputDecoration(
                      label: LabelRequire(labelText: "VRN"),
                      hintText: "Enter VRN",
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      scan(ScanMode.LicensePlate);
                    },
                    child: const Text(
                      'Scan',
                    ),
                  ),
                ),
                // TextButton(onPressed: () {}, child: child)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
