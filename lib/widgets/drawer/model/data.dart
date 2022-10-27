import 'package:flutter_svg/flutter_svg.dart';
import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class DataMenuItem {
  List<ItemMenu> data = [
    ItemMenu('Home', SvgPicture.asset('assets/svg/IconHome.svg'),
        HomeOverview.routeName),
    ItemMenu('Forms', SvgPicture.asset('assets/svg/IconForm.svg'), '/Forms'),
    ItemMenu(
        'Test printer',
        SvgPicture.asset(
          'assets/svg/IconPrinter2.svg',
        ),
        null),
    ItemMenu('Statistic', SvgPicture.asset('assets/svg/IconStatistic.svg'),
        ActiveFirstSeenScreen.routeName),
    ItemMenu(
        'Spot check',
        SvgPicture.asset(
          'assets/svg/IconSpotCheck.svg',
        ),
        GracePeriodList.routeName),

    // ItemMenu('Emergency call', 'assets/svg/IconCall.svg', '/route'),
  ];
  List<ItemMenu> navItem = [
    ItemMenu('Test printer', SvgPicture.asset('assets/svg/IconPrinter.svg'),
        HomeOverview.routeName),
    ItemMenu('Statistic', SvgPicture.asset('assets/svg/IconStatistic.svg'),
        HomeOverview.routeName),
    ItemMenu('Emerg. call', SvgPicture.asset('assets/svg/IconCall2.svg'),
        HomeOverview.routeName),
    ItemMenu('999', SvgPicture.asset('assets/svg/IconCall3.svg'),
        HomeOverview.routeName),
  ];
}
