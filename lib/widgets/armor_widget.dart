import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArmorWidget extends HookConsumerWidget {
  final bool helmet;
  final bool sword;
  final bool chest;
  final bool shield;
  final bool waist;
  final bool legs;

  ArmorWidget({
    required this.helmet,
    required this.sword,
    required this.chest,
    required this.shield,
    required this.waist,
    required this.legs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageWidth = screenHeight * 0.2; // Width of the soldier image
    double imageHeight = imageWidth * 1.539499;
    // 519 x 799
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: imageWidth,
              height: imageHeight,
              child: Image.asset(
                'lib/assets/Soilder/unplace body.imageset/unplace body.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          chest
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.04, imageHeight * -0.11),
                  child: Container(
                    width: imageWidth * 0.6,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/chest sheild.imageset/chest sheild.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          waist
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.045, imageHeight * 0.15),
                  child: Container(
                    width: imageWidth * 0.30,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/waist.imageset/waist.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          legs
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.037, imageHeight * 0.345),
                  child: Container(
                    width: imageWidth * 0.54,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/leg arms.imageset/leg arms.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          sword
              ? Transform.translate(
                  offset: Offset(imageWidth * 0.03, imageHeight * 0.3),
                  child: Container(
                    width: imageWidth * 0.96,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/sword with knob.imageset/sword with knob.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          shield
              ? Transform.translate(
                  offset: Offset(imageWidth * 0.23, imageHeight * 0.065),
                  child: Container(
                    width: imageWidth * 0.5,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/sheild.imageset/sheild.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          helmet
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.049, imageHeight * -0.39),
                  child: Container(
                    width: imageWidth * 0.33,
                    child: Image.asset(
                      'lib/assets/Soilder/body parts/Helmet.imageset/Helmet.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
