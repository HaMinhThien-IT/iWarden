import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace-period/index.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/parking-charges/parking_charge_list.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class DataMenuItem {
  List<ItemMenu> data = [
    ItemMenu('Home', 'assets/svg/IconHome.svg', HomeOverview.routeName),
    ItemMenu('First seen list', 'assets/svg/IconCar.svg',
        ActiveFirstSeenScreen.routeName),
    ItemMenu('Grace period list', 'assets/svg/IconClock.svg',
        GracePeriodList.routeName),
    ItemMenu('Parking Charges', 'assets/svg/IconCharges.svg',
        ParkingChargeList.routeName),
    ItemMenu('Forms', 'assets/svg/IconForm.svg', '/Forms'),
    // ItemMenu('Emergency call', 'assets/svg/IconCall.svg', '/route'),
  ];
  List<ItemMenu> navItem = [
    ItemMenu(
        'Test printer', 'assets/svg/IconPrinter.svg', HomeOverview.routeName),
    ItemMenu(
        'Statistic', 'assets/svg/IconStatistic.svg', HomeOverview.routeName),
    ItemMenu('Emerg. call', 'assets/svg/IconCall2.svg', HomeOverview.routeName),
    ItemMenu('999', 'assets/svg/IconCall3.svg', HomeOverview.routeName),
  ];
}
