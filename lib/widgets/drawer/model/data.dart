import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/send_form_screen.dart';
import 'package:iWarden/screens/statictis_screen.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';
import 'package:iWarden/widgets/drawer/model/nav_item.dart';

class DataMenuItem {
  List<ItemMenu> data = [
    ItemMenu('Home', 'assets/svg/LogoHome.svg', HomeOverview.routeName),
    ItemMenu('Forms', 'assets/svg/IconForm.svg', SendFormScreen.routeName),
    ItemMenu('Test printer', 'assets/svg/IconPrinter2.svg', 'test-printer'),
    ItemMenu(
        'Statistic', 'assets/svg/IconStatistic.svg', StatisticScreen.routeName),
    // ItemMenu(
    //     'Spot check',
    //     SvgPicture.asset(
    //       'assets/svg/IconSpotCheck.svg',
    //     ),
    //     GracePeriodList.routeName),

    // ItemMenu('Emergency call', 'assets/svg/IconCall.svg', '/route'),
  ];
}
