import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/helpers/location_helper.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:location/location.dart';

enum SingingCharacter { lafayette, jefferson }

class MapScreen extends StatefulWidget {
  static const routeName = 'site-car-park';
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? _previewImageUrl;

  // ignore: unused_element
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude!, longitude: locData.longitude!);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    SingingCharacter? character = SingingCharacter.lafayette;

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: ListTile(
            title: Text(
              'Ao ma',
              style: CustomTextStyle.h4.copyWith(
                color: ColorTheme.darkPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            horizontalTitleGap: -5,
            dense: true,
            subtitle: const Text(
              '71 Cherry Court SOUTHAMPTON SO53 5PD UK',
              style: TextStyle(
                color: ColorTheme.grey600,
                fontSize: 10,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/IconBack.svg"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomSheet: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ColorTheme.white,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: SvgPicture.asset(
                  "assets/svg/IconNext.svg",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Next',
                textAlign: TextAlign.center,
                style: CustomTextStyle.body2.copyWith(
                  color: ColorTheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorTheme.grey200,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                color: ColorTheme.white,
                height: screenHeight / 2,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '24 min (2km)',
                      style: CustomTextStyle.body1.copyWith(
                        color: ColorTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: _previewImageUrl == null
                          ? const Text(
                              'No Location Chosen',
                              textAlign: TextAlign.center,
                            )
                          : Image.network(
                              _previewImageUrl as String,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Lafayette'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.lafayette,
                  groupValue: character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.jefferson,
                  groupValue: character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      character = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
