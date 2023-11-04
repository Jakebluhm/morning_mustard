import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/armor_button_data.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/armor_widget.dart';
import 'package:tuple/tuple.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Armor'),
        backgroundColor: Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ref.navigationService.goToMenuPage();
            print("Left Icon button pressed!");
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
              child: Transform.rotate(
                angle: pi,
                child: Column(
                  children: [
                    CustomPaint(
                      size: Size(screenWidth, screenHeight * 0.05),
                      painter: TrianglePainter(),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(118, 0, 67, 1),
                          border: Border.all(
                            color: Color.fromRGBO(118, 0, 67, 1),
                            width: 0,
                          ),
                        ),
                        width: screenWidth,
                        height: screenHeight * 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.45,
                  child: Image.asset(
                    'lib/assets/Soilder/Put on.imageset/Put on .png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(screenWidth, screenHeight * 0.05),
                    painter: TrianglePainter(),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(118, 0, 67, 1),
                        border: Border.all(
                          color: Color.fromRGBO(118, 0, 67, 1),
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
                        onTap: () {
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
                        child: Image.asset(
                          buttonItem.imagePath,
                          width:
                              screenWidth * 0.15, // Adjust the size as needed
                          height:
                              screenHeight * 0.1, // Adjust the size as needed
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth * 0.45,
                      child: Image.asset(
                        'lib/assets/Soilder/Your Armor.imageset/Your Armor.png',
                        fit: BoxFit.contain,
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
      ..color = Color.fromRGBO(118, 0, 67, 1)
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
