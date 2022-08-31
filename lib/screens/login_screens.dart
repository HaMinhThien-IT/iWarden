import 'package:flutter/material.dart';
import 'package:iWarden/theme/textTheme.dart';
import '../theme/color.dart';

class LoginScreen extends StatefulWidget {
  static const routerName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  void login() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode fieldNodeUserName = FocusNode();
    return Scaffold(
      body: Form(
        key: _form,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "iWarden",
                style:
                    CustomTextStyle.h1.copyWith(color: ColorTheme.darkPrimary),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextFormField(
                  style: CustomTextStyle.body1.copyWith(color: Colors.black),
                  focusNode: fieldNodeUserName,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: ColorTheme.grey300),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'Enter username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a value';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextFormField(
                  style: CustomTextStyle.body1.copyWith(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: ColorTheme.grey300),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'Enter password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a value';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: ColorTheme.primary,
                      // onPrimary: Colors.yellow,
                      elevation: 0),
                  child: const Text('Log in'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    "Forget password?",
                    style: CustomTextStyle.body1
                        .copyWith(color: ColorTheme.grey600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
