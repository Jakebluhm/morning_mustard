import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:morning_mustard/constants/calendar_layout_constants.dart';
import 'package:morning_mustard/providers/calendar_provider.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/calendar_entry_widget.dart';

class CalendarPage extends HookConsumerWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caledarEntries = ref.watch(calendarEntriesProvider);
    final activeIndexNotifier = ref.watch(activeIndexProvider.notifier);
    final activeIndex = ref.watch(activeIndexProvider);

    List<String> days = [
      'Everyday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    List<Widget> daysColumnHeaders = List<Widget>.generate(
      days.length,
      (index) => Container(
        width: calenderDayWidth.w,
        decoration: BoxDecoration(color: Colors.deepPurple),
        child: Center(
          child: Text(
            days[index],
            style: TextStyle(color: Colors.white, fontSize: 4.sp),
          ),
        ),
      ),
    ); // Add the last Container separately

    // Set orientation to landscape when entering the page
    _setLandscapeOrientation();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prayers Today',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            // Reset orientation when leaving the page
            await _resetOrientation();
            // This line assumes you have a NavigationService set up as part of your app
            ref.navigationService.goToMenuPage();
            debugPrint("Left Icon button pressed!");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...daysColumnHeaders],
            ),
            Row(
              children: [
                CalendarEntryWidget(
                  imagePath: caledarEntries[0].imagePath,
                  index: caledarEntries[0].index,
                  onTap: () {
                    print("Setting active index to 0");
                    activeIndexNotifier.setActiveIndex(0);
                  },
                  isActive: activeIndex == 0,
                ),
                CalendarEntryWidget(
                  imagePath: caledarEntries[1].imagePath,
                  index: caledarEntries[1].index,
                  onTap: () {
                    print("Setting active index to 1");
                    activeIndexNotifier.setActiveIndex(1);
                  },
                  isActive: activeIndex == 1,
                ),
              ],
            )
          ],
        ),
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
    // Reset the orientation to default
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<Widget> _buildWeekSections(String day, int weeks) {
    return List.generate(weeks, (weekIndex) {
      return _buildDaySection(day + '_week_${weekIndex + 1}')
          .inGridArea('$day${weekIndex + 1}');
    });
  }

  Widget _buildDaySection(String day) {
    // Placeholder for individual day sections
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          Text(day),
          // Add icons or images for people here
        ],
      ),
    );
  }
}
