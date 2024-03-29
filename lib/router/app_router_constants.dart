enum AppRoutes {
  homePage,
  menuPage,
  actsPage,
  armorPage,
  calendarPage,
  boxPage,
  heartPage,
  speechPage,
  thoughtsPage,
}

extension AppRoutesExtension on AppRoutes {
  String toName() {
    switch (this) {
      case AppRoutes.homePage:
        return 'home_page';
      case AppRoutes.menuPage:
        return 'menu_page';
      case AppRoutes.actsPage:
        return 'acts_page';
      case AppRoutes.armorPage:
        return 'armor_page';
      case AppRoutes.calendarPage:
        return 'calendar_page';
      case AppRoutes.boxPage:
        return 'box_page';
      case AppRoutes.heartPage:
        return 'heart_page';
      case AppRoutes.speechPage:
        return 'speech_page';
      case AppRoutes.thoughtsPage:
        return 'thoughts_page';
    }
  }

  String toPath() {
    // Prefixes each name with a '/'
    return '/' + toName();
  }
}
