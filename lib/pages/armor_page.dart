import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/armor_button_data.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/armor_info_modal.dart';
import 'package:morning_mustard/widgets/armor_widget.dart';

class ArmorPage extends HookConsumerWidget {
  ArmorPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final chestItem = useState(false);
    final helmetItem = useState(false);
    final legsItem = useState(false);
    final shieldItem = useState(false);
    final swordItem = useState(false);
    final waistItem = useState(false);

    void onInfoPress(
      BuildContext context,
      String heading,
      String infoText,
    ) {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            ArmorInfoModal(heading: heading, infoText: infoText),
      );
    }

    ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Armor',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlaypenSans',
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ref.navigationService.goToMenuPage();
          },
        ),
      ),
      body: Container(
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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0x6b, 0x3e, 0x2e, 0.9),
                        border: Border.all(
                          color: Color.fromRGBO(0x6b, 0x3e, 0x2e, 0.9),
                          width: 0,
                        ),
                      ),
                      width: screenWidth,
                      height: screenHeight * 0.13,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 24.0.h),
                child: Container(
                  width: screenWidth * 0.45,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // Outline text
                      Text(
                        "Put on",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PlaypenSans',
                          letterSpacing: 2,
                          fontSize: 42,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Color.fromARGB(255, 224, 122, 54),
                          shadows: [
                            Shadow(
                              offset: Offset(3.0, 3),
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.85),
                            ),
                          ],
                        ),
                      ),
                      // Filled text
                      const Text(
                        "Put on",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PlaypenSans',
                          letterSpacing: 2,
                          fontSize: 42,
                          color:
                              Colors.white, // Change to your desired fill color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0x6b, 0x3e, 0x2e, 0.9),
                        border: Border.all(
                          color: Color.fromRGBO(0x6b, 0x3e, 0x2e, 0.9),
                          width: 0,
                        ),
                      ),
                      width: screenWidth,
                      height: screenHeight * 0.2,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Add this line
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: armorButtonItems.map((buttonItem) {
                      return GestureDetector(
                          onTap: () async {
                            // Trigger haptic feedback
                            await HapticFeedback.mediumImpact();
                            if (buttonItem.hasMatchingLabel('chest')) {
                              chestItem.value = !chestItem.value;
                            } else if (buttonItem.hasMatchingLabel('helmet')) {
                              helmetItem.value = !helmetItem.value;
                            } else if (buttonItem.hasMatchingLabel('legs')) {
                              legsItem.value = !legsItem.value;
                            } else if (buttonItem.hasMatchingLabel('shield')) {
                              shieldItem.value = !shieldItem.value;
                            } else if (buttonItem.hasMatchingLabel('sword')) {
                              swordItem.value = !swordItem.value;
                            } else if (buttonItem.hasMatchingLabel('waist')) {
                              waistItem.value = !waistItem.value;
                            }
                          },
                          child: Container(
                            width:
                                screenWidth * 0.14, // Adjust the size as needed
                            height: screenHeight * 0.1, // Adjust the size as
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(224, 85, 10, 1),
                                    width: 3),
                                color: Color.fromRGBO(255, 217, 141, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: buttonItem.hasMatchingLabel('shield')
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0.w),
                                    child: Image.asset(
                                      buttonItem.imagePath,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.0.w),
                                    child: Image.asset(
                                      buttonItem.imagePath,
                                    ),
                                  ),
                          ));
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.0.w,
                      right: 8.0.w,
                      top: 8.0.h,
                      bottom: 16.0.h,
                    ),
                    child: Container(
                      width: screenWidth * 0.75,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          // Outline text
                          Text(
                            "your armor",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 36,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Color.fromARGB(255, 224, 122, 54),
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.85),
                                ),
                              ],
                            ),
                          ),
                          // Filled text
                          const Text(
                            "your armor",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 36,
                              color: Colors
                                  .white, // Change to your desired fill color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ArmorWidget(
                chest: chestItem.value,
                helmet: helmetItem.value,
                legs: legsItem.value,
                shield: shieldItem.value,
                sword: swordItem.value,
                waist: waistItem.value,
                onInfoPress: onInfoPress,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(0x6b, 0x3e, 0x2e, 0.9)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
