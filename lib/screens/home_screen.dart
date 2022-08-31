// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:iWarden/theme/color.dart';
// import 'package:iWarden/theme/textTheme.dart';
// import 'package:iWarden/widgets/appBar.dart';
// import 'package:iWarden/widgets/drawer/app_drawer.dart';
// import 'package:iWarden/widgets/home/ButtonHome.dart';
// import 'package:iWarden/widgets/home/Item.dart';

// class HomeScreen extends StatefulWidget {
//   static const routerName = '/home';
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final heightScreen = MediaQuery.of(context).size.height;
//     final checkScreen = heightScreen < 400 ? 2.2 : 3.8;
//     return Scaffold(
//       appBar: const MyAppBar(),
//       drawer: const AppDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: heightScreen / checkScreen,
//               child: Stack(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     height: 110,
//                     decoration: const BoxDecoration(
//                         color: ColorTheme.primary,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(11),
//                             bottomRight: Radius.circular(11))),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               margin: const EdgeInsets.only(right: 5),
//                               child: const CircleAvatar(
//                                 backgroundImage: NetworkImage(
//                                     'https://s3.ap-southeast-1.amazonaws.com/we-xpats.com/uploads/article/6057/goku-5796332_640.png'),
//                               ),
//                             ),
//                             Text(
//                               " Hi,Ha Minh Thien",
//                               style: CustomTextStyle.body1
//                                   .copyWith(fontWeight: FontWeight.w600),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 75,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 35),
//                       width: MediaQuery.of(context).size.width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const <Widget>[
//                           ButtonHome(
//                               assetIcon: 'assets/svg/icon_ticket.svg',
//                               checked: false,
//                               route: '/',
//                               title: "Create Ticker"),
//                           ButtonHome(
//                               assetIcon: 'assets/svg/icon_check-in.svg',
//                               checked: false,
//                               route: '/',
//                               title: "Check-in"),
//                           ButtonHome(
//                               assetIcon: 'assets/svg/icon_call.svg',
//                               checked: false,
//                               route: '/',
//                               title: "Quick Call")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ItemTest(),
//           ],
//         ),
//       ),
//     );
//   }
// }
