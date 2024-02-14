import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:morning_mustard/pages/acts_page.dart';
import 'package:morning_mustard/pages/armor_page.dart';
import 'package:morning_mustard/pages/calendar_page.dart';
import 'package:morning_mustard/pages/heart_page.dart';
import 'package:morning_mustard/pages/home_page.dart';
import 'package:morning_mustard/pages/box_page.dart';
import 'package:morning_mustard/pages/menu_page.dart';
import 'package:morning_mustard/pages/thoughts_page.dart';
import 'package:morning_mustard/router/app_router_constants.dart';

class AppRouter {
  static GoRouter build(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
        navigatorKey: navigatorKey,
        observers: null,
        initialLocation: AppRoutes.homePage.toPath(),
        errorBuilder: (context, state) => Container(
              child: Text(
                'Error',
                style: TextStyle(
                  fontFamily: 'PlaypenSans',
                ),
              ),
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
          GoRoute(
            name: AppRoutes.armorPage.toName(),
            path: AppRoutes.armorPage.toPath(),
            builder: (context, state) => ArmorPage(),
          ),
          GoRoute(
            name: AppRoutes.calendarPage.toName(),
            path: AppRoutes.calendarPage.toPath(),
            builder: (context, state) => CalendarPage(),
          ),
          GoRoute(
            name: AppRoutes.boxPage.toName(),
            path: AppRoutes.boxPage.toPath(),
            builder: (context, state) => BoxPage(),
          ),
          GoRoute(
            name: AppRoutes.heartPage.toName(),
            path: AppRoutes.heartPage.toPath(),
            builder: (context, state) => HeartPage(),
          ),
          GoRoute(
            name: AppRoutes.speechPage.toName(),
            path: AppRoutes.speechPage.toPath(),
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: AppRoutes.thoughtsPage.toName(),
            path: AppRoutes.thoughtsPage.toPath(),
            builder: (context, state) => ThoughtsPage(),
          ),
        ]);
  }
}
