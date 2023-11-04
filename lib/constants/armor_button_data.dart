import 'package:flutter/foundation.dart';

class ButtonItem {
  final String imagePath;
  final String label;
  ValueNotifier<bool> show; // Use ValueNotifier for reactive UI updates

  ButtonItem({
    required this.imagePath,
    required this.label,
    bool show = false, // Initialize with default value
  }) : show = ValueNotifier(
            show); // Initialize the ValueNotifier with the show value
}

List<ButtonItem> armorButtonItems = [
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/west with box.imageset/west with box.png',
    label: 'waist',
  ),
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/shord with box.imageset/shord with box.png',
    label: 'sword',
  ),
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/sheild with box.imageset/sheild with box.png',
    label: 'shield',
  ),
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/leg arms with box.imageset/leg arms with box.png',
    label: 'legs',
  ),
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/Helmet with box.imageset/Helmet with box.png',
    label: 'helmet',
  ),
  ButtonItem(
    imagePath:
        'lib/assets/Soilder/armor with box/chest sheild with box.imageset/chest sheild with box.png',
    label: 'chest',
  ),
  // Add other items here if needed
];

extension ArmorButtonItemsExtension on List<ButtonItem> {
  ButtonItem? findByLabel(String label) {
    // You don't need to change the case since you're using exact match labels now.
    return firstWhere(
      (item) => item.label == label,
      // This will handle the case where no item is found.
    );
  }
}
