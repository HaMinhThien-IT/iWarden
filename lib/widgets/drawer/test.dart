// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:iWarden/theme/color.dart';
// import 'package:iWarden/widgets/drawer/Info.dart';
// import 'Drawer.dart' as d;

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     Widget _buildButtonDrawer(d.Drawer data) {
//       return ListTile(
//         leading: SvgPicture.asset(
//           data.assetIcon,
//           color: ColorTheme.secondary,
//         ),
//         title: Align(
//           alignment: const Alignment(-1.3, 0),
//           child: Text(data.title),
//         ),
//         onTap: () {
//           Navigator.of(context).pushReplacementNamed(data.route);
//         },
//       );
//     }



//     return ClipRRect(
      
//       child: Drawer(
//         child: Column(children: <Widget>[
//           AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             title: Row(
//               children: const <Widget>[
//                 // Logo(checkHome: true),
//               ],
//             ),
//             automaticallyImplyLeading: false,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Info(
//             mediaQuery: mediaQuery,
//             assetImage:
//                 'https://s3.ap-southeast-1.amazonaws.com/we-xpats.com/uploads/article/6057/goku-5796332_640.png',
//             name: "Kakarot",
//           ),
//           SizedBox(
//             child: Column(
//               children: getList(),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }