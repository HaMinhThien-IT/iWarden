import 'package:flutter/material.dart';
import 'package:iWarden/common/InputSearch.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(color: ColorTheme.primary),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: CircleAvatar(
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome John Wick!',
                      style: CustomTextStyle.body1.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight - 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -30,
                      width: 270,
                      child: Material(
                        borderRadius: BorderRadius.circular(100),
                        child: const InputSearch(
                          hintText: 'Search for your location',
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 21,
                                child: Icon(Icons.location_on_outlined),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Set Your Location',
                                style: CustomTextStyle.h4.copyWith(
                                  decoration: TextDecoration.none,
                                  color: ColorTheme.darkPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        Form(
                          child: Material(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Site Near Me!',
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Site Near Me!',
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Site Near Me!',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
