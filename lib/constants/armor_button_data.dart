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
    imagePath: 'lib/assets/SoilderV3/Sword.png',
    label: 'sword',
  ),
  ButtonItem(
    imagePath: 'lib/assets/SoilderV3/Waist.png',
    label: 'waist',
  ),
  ButtonItem(
    imagePath: 'lib/assets/SoilderV3/Sheild.png',
    label: 'shield',
  ),
  ButtonItem(
    imagePath: 'lib/assets/SoilderV3/Chest.png',
    label: 'chest',
  ),
  ButtonItem(
    imagePath: 'lib/assets/SoilderV3/Helmet.png',
    label: 'helmet',
  ),
  ButtonItem(
    imagePath: 'lib/assets/SoilderV3/Legs.png',
    label: 'legs',
  ),
  // Add other items here if needed
];

extension ButtonItemExtension on ButtonItem {
  bool hasMatchingLabel(String labelToMatch) {
    return this.label == labelToMatch;
  }
}
