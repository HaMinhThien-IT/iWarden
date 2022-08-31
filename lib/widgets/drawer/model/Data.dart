import 'package:iWarden/widgets/drawer/model/MenuItem.dart';

class DataMenuItem {
  List<ItemMenu> data = [
    ItemMenu('Home', 'assets/svg/IconHome.svg', '/'),
    ItemMenu('First seen list', 'assets/svg/IconCar.svg', '/First'),
    ItemMenu('Grace period list', 'assets/svg/IconClock.svg', '/Grace'),
    ItemMenu('Parking Charges', 'assets/svg/IconPacking.svg', '/Parking'),
    ItemMenu('Forms', 'assets/svg/IconForm.svg', '/Forms'),
    ItemMenu('Emergency call', 'assets/svg/IconCall.svg', '/route'),
  ];
}
