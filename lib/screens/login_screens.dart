import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/controllers/user_controller.dart';
import 'package:iWarden/providers/auth.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:provider/provider.dart';
import '../theme/color.dart';
import 'package:aad_oauth/aad_oauth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 107,
                  height: 40,
                  child: Image.asset("assets/images/LogoUKPC.png")),
              const SizedBox(
                height: 60,
              ),
              Text("Parking operative",
                  style: CustomTextStyle.h6.copyWith(
                    color: ColorTheme.grey600,
                  )),
              Text(
                "iTicket",
                style: CustomTextStyle.h1.copyWith(color: ColorTheme.primary),
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
                onPressed: () {
                  authProvider.loginWithMicrosoft();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: ColorTheme.primary),
                ),
                icon: SvgPicture.asset("assets/svg/IconMicrosoft.svg"),
                label: const Text(
                  "Sign in with Microsoft",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
