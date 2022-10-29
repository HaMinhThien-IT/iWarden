import 'package:flutter/material.dart';
import 'package:iWarden/common/add_image.dart';
import 'package:iWarden/common/custom_checkbox.dart';
import 'package:iWarden/theme/text_theme.dart';
import 'package:iWarden/widgets/app_bar.dart';
import 'package:iWarden/widgets/drawer/app_drawer.dart';

class SendFormScreen extends StatefulWidget {
  static const routeName = '/send-form';
  const SendFormScreen({super.key});

  @override
  State<SendFormScreen> createState() => _SendFormScreenState();
}

class _SendFormScreenState extends State<SendFormScreen> {
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "Send form",
        automaticallyImplyLeading: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              color: Colors.white,
              child: Column(
                children: [
                  TextFormField(
                      style: CustomTextStyle.h6,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "Please enter description",
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomCheckBox(
                    value: checkbox,
                    onChanged: (val) {
                      setState(() {
                        checkbox = val;
                      });
                    },
                    title: "Tick if a body camera was used",
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              child: AddImage(
                  listImage: [],
                  onAddImage: () {},
                  displayTitle: true,
                  isCamera: true,
                  isSlideImage: false),
            )
          ],
        ),
      ),
    );
  }
}
