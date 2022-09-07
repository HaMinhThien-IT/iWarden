import 'package:iWarden/screens/first-seen/ActiveFirstSeenScreen.dart';
import 'package:iWarden/screens/GracePeriodScreen.dart';
import 'package:iWarden/screens/HomeOverview.dart';
import 'package:iWarden/screens/ParkingChargesScreen.dart';
import 'package:iWarden/widgets/drawer/model/MenuItem.dart';

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
