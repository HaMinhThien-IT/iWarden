import 'package:iWarden/screens/first-seen/active_first_seen_screen.dart';
import 'package:iWarden/screens/grace_period_screen.dart';
import 'package:iWarden/screens/home_overview.dart';
import 'package:iWarden/screens/parking_charges_screen.dart';
import 'package:iWarden/widgets/drawer/model/menu_item.dart';

class DataMenuItem {
  List<ItemMenu> data = [
    ItemMenu('Home', 'assets/svg/IconHome.svg', HomeOverview.routeName),
    ItemMenu('First seen list', 'assets/svg/IconCar.svg',
        ActiveFirstSeenScreen.routeName),
    ItemMenu('Grace period list', 'assets/svg/IconClock.svg',
        GracePeriodScreen.routeName),
    ItemMenu('Parking Charges', 'assets/svg/IconCharges.svg',
        ParkingChargesScreen.routeName),
    ItemMenu('Forms', 'assets/svg/IconForm.svg', '/Forms'),
    ItemMenu('Emergency call', 'assets/svg/IconCall.svg', '/route'),
  ];
}