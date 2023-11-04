import 'package:morning_mustard/router/app_router_constants.dart';

class ButtonItem {
  final String imagePath;
  final String label;
  final AppRoutes? route;

  ButtonItem({required this.imagePath, required this.label, this.route});
}

List<ButtonItem> buttonItems = [
  ButtonItem(
      imagePath: 'lib/assets/menu/menu_acts.imageset/menu_acts.png',
      label: 'Label 1',
      route: AppRoutes.actsPage),
  ButtonItem(
      imagePath: 'lib/assets/menu/menu_calendar.imageset/menu_calendar.png',
      label: 'Label 3'),
  ButtonItem(
      imagePath: 'lib/assets/menu/menu_heart.imageset/menu_heart.png',
      label: 'Label 4'),
  ButtonItem(
      imagePath: 'lib/assets/menu/menu_soldier.imageset/menu_soldier.png',
      label: 'Label 5',
      route: AppRoutes.armorPage),
  ButtonItem(
      imagePath:
          'lib/assets/menu/menu_treasurebox.imageset/menu_treasurebox.png',
      label: 'Label 6'),
  ButtonItem(
      imagePath: 'lib/assets/menu/menu_bubble.imageset/menu_bubble.png',
      label: 'Label 2'),
];
