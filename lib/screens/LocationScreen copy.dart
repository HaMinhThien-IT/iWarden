import 'package:flutter/material.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        decoration: const BoxDecoration(color: ColorTheme.primary),
        child: Stack(
          children: [
            Positioned(
              width: screenWidth,
              height: 150,
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
            Positioned(
              top: 150,
              child: Container(
                width: screenWidth,
                height: screenHeight - 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:iWarden/theme/color.dart';
// import 'package:iWarden/theme/textTheme.dart';

// class LocationScreen extends StatelessWidget {
//   static const routeName = '/location';
//   const LocationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//         decoration: const BoxDecoration(color: ColorTheme.primary),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 150,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 48,
//                     height: 48,
//                     child: CircleAvatar(
//                       child: Image.asset('assets/images/avatar.png'),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'Welcome John Wick!',
//                     style: CustomTextStyle.body1.copyWith(
//                       color: Colors.white,
//                       decoration: TextDecoration.none,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: screenHeight - 150,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: [
//                   Positioned(
//                     top: -20,
//                     width: screenWidth,
//                     child: const SizedBox(
//                       child: TextField(
//                         decoration: InputDecoration(hintText: 'Name'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
