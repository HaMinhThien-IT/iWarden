import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iWarden/models/Site.dart';
import 'package:iWarden/widgets/location/TabbarItem.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/appBar.dart';
import '../models/Location.dart';
import 'package:flutter_svg/svg.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/location';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final locations = LocationList().locations.toList();
    final siteList = SiteList().sites.toList();

    String dropdownValue = locations[0].value;

    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          dropdownValue = selectedValue;
        });
      }
    }

    return Scaffold(
      bottomSheet: TextButton(
        onPressed: () {},
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(
            bottom: screenHeight > 400 ? screenHeight / 10 : screenHeight / 5,
          ),
          child: Column(
            children: [
              Card(
                elevation: 0,
                margin: EdgeInsets.only(top: screenHeight / 10),
                child: ListTile(
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      child: Image.asset('assets/images/avatar.png'),
                    ),
                  ),
                  title: Text(
                    'Welcome Tom Smiths!',
                    style: CustomTextStyle.h6.copyWith(
                      color: ColorTheme.textPrimary,
                    ),
                  ),
                  subtitle: Text(
                    'Email: tom.smiths@ukparkingcontrol.com',
                    style: CustomTextStyle.chart.copyWith(
                      color: ColorTheme.grey600,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Set your location',
                        style: CustomTextStyle.body1.copyWith(
                          color: ColorTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField2(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          labelText: 'Location',
                          hintText: 'Select location',
                        ),
                        items: locations
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item.value,
                                child: Text(item.label),
                              ),
                            )
                            .toList(),
                        value: dropdownValue,
                        onChanged: dropdownCallback,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TabbarItem(
                        sites: siteList,
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}