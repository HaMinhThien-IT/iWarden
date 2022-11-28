import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/common/Camera/camera_picker.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/my_dialog.dart';
import 'package:iWarden/configs/const.dart';
import 'package:iWarden/controllers/vehicle_information_controller.dart';
import 'package:iWarden/models/first_seen.dart';
import 'package:iWarden/models/vehicle_information.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/parking-charges/issue_pcn_first_seen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/detail_issue.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

final azureContainerImageUrl = dotenv.get(
  'AZURE_CONTAINER_IMAGE_URL',
  fallback: 'https://iwardendev.blob.core.windows.net/wardentest',
);

class DetailScreen extends StatefulWidget {
  final TypeFirstSeen type;

  const DetailScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final padding = widget.type == TypeFirstSeen.Expired ? 30.0 : 05.0;
    final divisor = widget.type == TypeFirstSeen.Expired ? 3 : 2;
    final divisor2 = widget.type == TypeFirstSeen.Expired ? 0.00 : 12;
    final bool isCamera = widget.type == TypeFirstSeen.Expired ? true : false;
    final args =
        ModalRoute.of(context)!.settings.arguments as VehicleInformation;
    final calculateTime = CalculateTime();
    final List<String> imgList = [];
    final vehicleInfoController = VehicleInfoController();

    for (int i = 0; i < args.EvidencePhotos!.length; i++) {
      imgList
          .add('$azureContainerImageUrl/${args.EvidencePhotos![i].BlobName}');
    }

    void onCarLeft() {
      VehicleInformation vehicleInfoToUpdate = VehicleInformation(
        ExpiredAt: args.ExpiredAt,
        Plate: args.Plate,
        ZoneId: args.ZoneId,
        LocationId: args.LocationId,
        BayNumber: args.BayNumber,
        Type: args.Type,
        Latitude: args.Latitude,
        Longitude: args.Longitude,
        CarLeft: true,
        EvidencePhotos: [],
        Id: args.Id,
      );

      showDialog<void>(
        context: context,
        barrierDismissible: true,
        barrierColor: ColorTheme.backdrop,
        builder: (BuildContext context) {
          return MyDialog(
            title: Text(
              "Confirm",
              style: CustomTextStyle.h4.copyWith(color: ColorTheme.danger),
            ),
            subTitle: const Text(
              "Confirm the vehicle has left.",
              style: CustomTextStyle.h5,
            ),
            func: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorTheme.danger,
              ),
              child: Text("Proceed",
                  style: CustomTextStyle.h5.copyWith(
                    color: Colors.white,
                  )),
              onPressed: () async {
                await vehicleInfoController
                    .upsertVehicleInfo(vehicleInfoToUpdate)
                    .then((value) {
                  Navigator.of(context).pushReplacementNamed(
                    args.Type == 0
                        ? ActiveFirstSeenScreen.routeName
                        : GracePeriodList.routeName,
                  );
                });
              },
            ),
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MyAppBar(
          title: args.Type == 0
              ? 'First seen details'
              : 'Consideration Period details',
          automaticallyImplyLeading: true,
          onRedirect: () {
            args.Type == 0
                ? Navigator.of(context)
                    .popAndPushNamed(ActiveFirstSeenScreen.routeName)
                : Navigator.of(context)
                    .popAndPushNamed(GracePeriodList.routeName);
          },
        ),
        drawer: const MyDrawer(),
        bottomSheet: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorTheme.grey300),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ((widthScreen / divisor) - padding) - divisor2,
                  child: TextButton.icon(
                      onPressed: onCarLeft,
                      icon: SvgPicture.asset(
                        "assets/svg/IconCar.svg",
                        width: 16,
                      ),
                      label: const Text(
                        "Car left",
                        style: CustomTextStyle.h6,
                      )),
                ),
                if (widget.type == TypeFirstSeen.Expired)
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
                if (widget.type == TypeFirstSeen.Expired)
                  SizedBox(
                    width: ((widthScreen / divisor) - padding) - divisor2,
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            IssuePCNFirstSeenScreen.routeName,
                            arguments: args,
                          );
                        },
                        icon: SvgPicture.asset(
                          "assets/svg/IconCharges2.svg",
                          width: 16,
                        ),
                        label: const Text(
                          "Issue PCN",
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
                  width: ((widthScreen / divisor) - padding) - divisor2,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/svg/IconLocation.svg",
                        width: 16,
                      ),
                      label: const Text(
                        "Located",
                        style: CustomTextStyle.h6,
                      )),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width < 400
                  ? 0
                  : ConstSpacing.bottom,
            ),
            child: Column(
              children: <Widget>[
                DetailIssue(
                  plate: args.Plate,
                  createdAt: args.Created as DateTime,
                  bayNumber: args.BayNumber,
                ),
                Container(
                  color: widget.type == TypeFirstSeen.Expired
                      ? ColorTheme.lightDanger
                      : ColorTheme.lightSuccess,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    widget.type == TypeFirstSeen.Active
                        ? "Expiring in: ${calculateTime.getDuration(Duration(minutes: calculateTime.daysBetween(
                            args.Created!.add(
                              Duration(
                                minutes: calculateTime.daysBetween(
                                  args.Created as DateTime,
                                  DateTime.now(),
                                ),
                              ),
                            ),
                            args.ExpiredAt,
                          )))}"
                        : "Expired in: ${calculateTime.getDurationExpiredIn(Duration(minutes: calculateTime.daysBetween(
                            args.ExpiredAt,
                            DateTime.now(),
                          )))}",
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.h5.copyWith(
                      color: widget.type == TypeFirstSeen.Expired
                          ? ColorTheme.danger
                          : ColorTheme.success,
                    ),
                  ),
                ),
                AddImage(
                  isSlideImage: true,
                  listImage: imgList,
                  isCamera: isCamera,
                  onAddImage: () async {
                    final results =
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CameraPicker(
                                  titleCamera: "Add",
                                  onDelete: (file) {
                                    return true;
                                  },
                                )));
                    if (results != null) {
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
