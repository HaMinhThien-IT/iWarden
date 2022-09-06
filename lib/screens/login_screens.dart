import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/theme/textTheme.dart';
import '../theme/color.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "iWarden",
              style: CustomTextStyle.h1.copyWith(color: ColorTheme.darkPrimary),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Welcome to iWarden! We’re glad you’re here!",
              style: CustomTextStyle.h6,
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: ColorTheme.primary),
                ),
                icon: SvgPicture.asset("assets/svg/IconMicrosoft.svg"),
                label: const Text("Sign in with Microsoft"))
          ],
        ),
      ),
    );
  }
}
