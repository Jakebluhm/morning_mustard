import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:morning_mustard/pages/acts_page.dart';
import 'package:morning_mustard/pages/home_page.dart';
import 'package:morning_mustard/pages/menu_page.dart';
import 'package:morning_mustard/router/app_router_constants.dart';

class AppRouter {
  static GoRouter build(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
        navigatorKey: navigatorKey,
        observers: null,
        initialLocation: AppRoutes.homePage.toPath(),
        errorBuilder: (context, state) => Container(
              child: Text('Error'),
            ),
        routes: [
          GoRoute(
            name: AppRoutes.homePage.toName(),
            path: AppRoutes.homePage.toPath(),
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            name: AppRoutes.menuPage.toName(),
            path: AppRoutes.menuPage.toPath(),
            builder: (context, state) => MenuPage(),
          ),
          GoRoute(
            name: AppRoutes.actsPage.toName(),
            path: AppRoutes.actsPage.toPath(),
            builder: (context, state) => ActsPage(),
          ),
        ]);
  }
}
