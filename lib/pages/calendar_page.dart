import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class CalendarPage extends HookConsumerWidget {
  CalendarPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set orientation to landscape when entering the page
    _setLandscapeOrientation();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            // Reset orientation when leaving the page
            await _resetOrientation();
            ref.navigationService.goToMenuPage();
            debugPrint("Left Icon button pressed!");
          },
        ),
      ),
      body: const Center(
        child: Text("Calendar"),
      ),
    );
  }

  void _setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> _resetOrientation() async {
    // Reset the orientation to both portrait and landscape
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
