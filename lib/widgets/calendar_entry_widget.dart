import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/calendar_layout_constants.dart';
import 'package:morning_mustard/providers/calendar_provider.dart';

class CalendarEntryWidget extends HookConsumerWidget {
  final String imagePath;
  final int index;
  final bool isActive;
  final VoidCallback onTap;

  const CalendarEntryWidget(
      {Key? key,
      required this.imagePath,
      required this.index,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final activeIndexNotifier = ref.watch(activeIndexProvider.notifier);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: calenderDayWidth.w,
        height: calenderDayHeight.h,
        decoration: BoxDecoration(
            border: Border.all(color: isActive ? Colors.red : Colors.black)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(0.0),
                icon: Icon(
                  Icons.info_outline,
                  size: 5.w,
                ), // Replace with your desired icon
                onPressed: () {
                  // Handle your button action here
                  print('Button tapped');
                },
              ),
            ),
            Center(
              child: Image.asset(
                'lib/assets/Soilder/body parts/waist.imageset/waist.png', // Replace with your actual image path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
