import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/calendar_layout_constants.dart';
import 'package:morning_mustard/providers/calendar_provider.dart';
import 'package:path_provider/path_provider.dart';

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
    final caledarEntriesNotifier = ref.watch(calendarEntriesProvider.notifier);
    final imageComponent = useMemoized(() {
      return FutureBuilder<Widget>(
        future: _getImageWidget(imagePath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? Container();
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    }, [imagePath]);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.calendarDayWidth,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            border: Border.all(color: isActive ? Colors.red : Colors.black)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0.0.h),
              child: Center(
                child: imageComponent,
              ),
            ),
            name.isNotEmpty
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.45),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                name,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'PlaypenSans',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),
            Positioned(
              top: 2.h,
              right: 1.w,
              child: InkWell(
                // alignment: Alignment.topRight,
                // constraints: BoxConstraints(),
                // padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.info_outline,
                  size: 5.w,
                ), // Replace with your desired icon
                onTap: () async {
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
                          style: const TextStyle(
                            fontFamily: 'PlaypenSans',
                          ),
                          controller: controller,
                          decoration:
                              InputDecoration(hintText: "Enter new name"),
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'PlaypenSans',
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontFamily: 'PlaypenSans',
                              ),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pop(controller.text),
                          ),
                          TextButton(
                            child: const Text(
                              'Clear Image',
                              style: TextStyle(
                                fontFamily: 'PlaypenSans',
                              ),
                            ),
                            onPressed: () => caledarEntriesNotifier
                                .updateImagePath(index, ''),
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
          ],
        ),
      ),
    );
  }

  Future<Widget> _getImageWidget(String imagePath) async {
    if (imagePath.isEmpty) {
      return Container();
    } else if (imagePath.startsWith("lib/assets") ||
        imagePath.startsWith("assets")) {
      // This is an asset image
      return Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Text('Error loading image');
        },
      );
    } else {
      // This is a file system image
      try {
        final directory = await getApplicationDocumentsDirectory();
        final fullPath = '${directory.path}/$imagePath';
        final file = File(fullPath);

        if (await file.exists()) {
          return Image.file(
            file,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Text('Error loading image');
            },
          );
        } else {
          return Text('Image not found');
        }
      } catch (e) {
        return Text('Error accessing image');
      }
    }
  }
}
