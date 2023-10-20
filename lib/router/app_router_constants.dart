enum AppRoutes {
  homePage,
  menuPage,
  actsPage,
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
    }
  }

  String toPath() {
    switch (this) {
      case AppRoutes.homePage:
        return '/home_page';
      case AppRoutes.menuPage:
        return '/menu_page';
      case AppRoutes.actsPage:
        return '/acts_page';
    }
  }
}
