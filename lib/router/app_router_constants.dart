enum AppRoutes {
  homePage,
  menuPage,
}

extension AppRoutesExtension on AppRoutes {
  String toName() {
    switch (this) {
      case AppRoutes.homePage:
        return 'home_page';
      case AppRoutes.menuPage:
        return 'menu_page';
    }
  }

  String toPath() {
    switch (this) {
      case AppRoutes.homePage:
        return '/home_page';
      case AppRoutes.menuPage:
        return '/menu_page';
    }
  }
}
