import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:morning_mustard/constants/calendar_image_paths.dart';
import 'package:morning_mustard/constants/calendar_layout_constants.dart';
import 'package:morning_mustard/providers/calendar_entry.dart';
import 'package:morning_mustard/providers/calendar_provider.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/calendar_entry_widget.dart';

class CalendarPage extends HookConsumerWidget {
  CalendarPage({Key? key}) : super(key: key);

  Widget buildCalendarEntryRow({
    required List<CalendarEntry> entriesSegment,
    required WidgetRef ref,
    required int? activeIndex,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: entriesSegment.map((entry) {
        return CalendarEntryWidget(
          imagePath: entry.imagePath,
          name: entry.name,
          index: entry.index,
          onTap: () {
            ref.read(activeIndexProvider.notifier).setActiveIndex(entry.index);
            print("Setting active index to ${entry.index}");
          },
          isActive: activeIndex == entry.index,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final caledarEntries = ref.watch(calendarEntriesProvider);
    final caledarEntriesNotifier = ref.watch(calendarEntriesProvider.notifier);
    final activeIndexNotifier = ref.watch(activeIndexProvider.notifier);
    final activeIndex = ref.watch(activeIndexProvider);

    // Assuming calendarEntries is a list with at least 16 items
    final firstRowEntries = caledarEntries.sublist(0, 8);
    final secondRowEntries = caledarEntries.sublist(8, 16);
    final thirdRowEntries = caledarEntries.sublist(16, 23);
    final fourthRowEntries = caledarEntries.sublist(23, 30);

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
        height: 15.h,
        decoration: BoxDecoration(color: Color.fromARGB(255, 94, 126, 220)),
        child: Center(
          child: Text(
            days[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 4.sp,
              fontFamily: 'OverlockSC',
            ),
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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OverlockSC',
          ),
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
      body: OverflowBox(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 219, 88, 1.0),
                  Color.fromRGBO(0xf7, 0xd4, 0x86, 1.0),
                  Color.fromRGBO(0xc5, 0xf9, 0xd7, 1.0),
                ]),
          ),
          child: Center(
            child: Container(
              height: ((calenderDayHeight * 4) + 15 + 20).h,
              width: ((calenderDayWidth * 8) + 12).w,
              child: Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [...daysColumnHeaders],
                        ),
                        buildCalendarEntryRow(
                          entriesSegment: firstRowEntries,
                          ref: ref,
                          activeIndex: activeIndex,
                        ),
                        buildCalendarEntryRow(
                          entriesSegment: secondRowEntries,
                          ref: ref,
                          activeIndex: activeIndex,
                        ),
                        buildCalendarEntryRow(
                          entriesSegment: thirdRowEntries,
                          ref: ref,
                          activeIndex: activeIndex,
                        ),
                        buildCalendarEntryRow(
                          entriesSegment: fourthRowEntries,
                          ref: ref,
                          activeIndex: activeIndex,
                        ),
                      ],
                    ),
                    Positioned(
                      top: (calenderDayHeight * 2) +
                          17.h, // Positions the container at the bottom of the stack
                      right: (calenderDayWidth * 7)
                          .w, // Positions the container to the right of the stack
                      child: Container(
                        // Define your container's appearance and contents here
                        width: calenderDayWidth
                            .w, // Specify the width of the container
                        height: (calenderDayHeight.h) *
                            2, // Specify the height of the container
                        decoration: BoxDecoration(
                            color: Colors.blue, // Example color
                            border: Border.all()),
                        child: Center(
                          child: ListView.builder(
                            itemCount: FaceImages.paths.length,
                            itemBuilder: (context, index) {
                              // Generating dummy data for each item
                              String itemData = '${index + 1}';

                              return GestureDetector(
                                onTap: () =>
                                    caledarEntriesNotifier.updateImagePath(
                                        activeIndexNotifier.getActiveIndex(),
                                        FaceImages.paths[index]),
                                child: Container(
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Image.asset(
                                    FaceImages.paths[
                                        index], // Replace with your actual image path
                                    fit: BoxFit
                                        .cover, // Adjust the fit as needed
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          Text(
            day,
            style: TextStyle(
              fontFamily: 'OverlockSC',
            ),
          ),
          // Add icons or images for people here
        ],
      ),
    );
  }
}
