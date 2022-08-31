// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:iWarden/theme/color.dart';
// import 'package:iWarden/theme/textTheme.dart';

// class ButtonHome extends StatelessWidget {
//   final String title;
//   final String assetIcon;
//   final bool checked;
//   final String route;
//   const ButtonHome(
//       {Key? key,
//       required this.assetIcon,
//       required this.checked,
//       required this.route,
//       required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).pushReplacementNamed(route);
//       },
//       child: Column(children: <Widget>[
//         Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Container(
//               height: 60,
//               width: 60,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     color: ColorTheme.boxShadow,
//                 //     blurRadius: 5.0,
//                 //     spreadRadius: 0.0,
//                 //     offset: Offset(2.5, 2.5),
//                 //   )
//                 // ],
//               ),
//             ),
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     width: 2,
//                     color: !checked ? ColorTheme.color1 : Colors.white),
//                 color: checked ? ColorTheme.color1 : Colors.transparent,
//                 borderRadius: const BorderRadius.all(Radius.circular(50)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SvgPicture.asset(
//                     assetIcon,
//                     color: !checked ? ColorTheme.color1 : Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Text(
//           title,
//           style: CustomTextStyle.body1.copyWith(color: ColorTheme.textPrimary),
//         )
//       ]),
//     );
//   }
// }
