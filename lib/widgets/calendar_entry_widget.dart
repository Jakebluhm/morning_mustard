import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/calendar_layout_constants.dart';
import 'package:morning_mustard/providers/calendar_provider.dart';

class CalendarEntryWidget extends HookConsumerWidget {
  final String imagePath;
  final String name;
  final int index;
  final bool isActive;
  final VoidCallback onTap;

  const CalendarEntryWidget(
      {Key? key,
      required this.imagePath,
      required this.name,
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
            color: Colors.white.withOpacity(0.75),
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
                onPressed: () async {
                  // Create a TextEditingController
                  final TextEditingController controller =
                      TextEditingController();
                  // Show dialog
                  final newName = await showDialog<String>(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: AlertDialog(
                        title: const Text(
                          'Edit Name',
                          style: TextStyle(
                            fontFamily: 'PlaypenSans',
                          ),
                        ),
                        content: TextField(
                          style: TextStyle(
                            fontFamily: 'PlaypenSans',
                          ),
                          controller: controller,
                          decoration:
                              InputDecoration(hintText: "Enter new name"),
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'PlaypenSans',
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontFamily: 'PlaypenSans',
                              ),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pop(controller.text),
                          ),
                        ],
                      ),
                    ),
                  );

                  if (newName != null && newName.isNotEmpty) {
                    ref
                        .read(calendarEntriesProvider.notifier)
                        .updateName(index, newName);
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 14.0.h),
              child: Center(
                child: imagePath.isNotEmpty
                    ? Image.asset(
                        imagePath, // Replace with your actual image path
                        fit: BoxFit.cover, // Adjust the fit as needed
                      )
                    : Container(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 4.sp,
                  fontFamily: 'PlaypenSans',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
