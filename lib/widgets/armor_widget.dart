import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;

double degreesToRadians(double degrees) {
  return degrees * (math.pi / 180);
}

class ArmorWidget extends HookConsumerWidget {
  final bool helmet;
  final bool sword;
  final bool chest;
  final bool shield;
  final bool waist;
  final bool legs;
  Function onInfoPress;

  ArmorWidget({
    required this.helmet,
    required this.sword,
    required this.chest,
    required this.shield,
    required this.waist,
    required this.legs,
    required this.onInfoPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageWidth = screenHeight * 0.275; // Width of the soldier image
    double imageHeight = imageWidth * 1.539499;
    // 519 x 799
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 56.0.w, bottom: 24.0.w),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: imageWidth,
                height: imageHeight,
                child: Image.asset(
                  'lib/assets/SoilderV3/v2-black.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Chest
            chest
                ? Transform.translate(
                    offset: Offset(imageWidth * -0.175, imageHeight * -0.125),
                    child: GestureDetector(
                      onTap: () {
                        print('Handle chest tap');
                        onInfoPress(context, "Breast Plate of Righteousness",
                            "I put on the breastplate of righteousness to protect my heart from evil desires and temptations, for everything I do flows out of it. Through Your Son, Jesus Christ, I have been made righteous in Your sight. Help me to live by the power of the Holy Spirit as a righteous person.");
                      },
                      child: Container(
                        //decoration: BoxDecoration(border: Border.all()),
                        width: imageWidth * 0.575,
                        child: Image.asset(
                          'lib/assets/SoilderV3/Chest.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            // Waist
            waist
                ? Transform.translate(
                    offset: Offset(imageWidth * -0.140, imageHeight * 0.085),
                    child: GestureDetector(
                      onTap: () {
                        print('Handle waist tap');
                        onInfoPress(context, "Belt of Truth",
                            "I fasten on the belt of truth, for Your Word protects me from Satan's lies and deception. May Your Truth rule in my heart, my mind, and my words.");
                      },
                      child: Container(
                        width: imageWidth * 0.32,
                        child: Image.asset(
                          'lib/assets/SoilderV3/Waist.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            // Legs
            legs
                ? Transform.translate(
                    offset: Offset(imageWidth * -0.14, imageHeight * 0.35),
                    child: GestureDetector(
                      onTap: () {
                        print('Handle legs tap');
                        onInfoPress(
                            context,
                            "Shod My Feet w/the Preparation of the Gospel",
                            "I tie on the footgear of the Gospel of peace, so I am ready to take the good news of what Jesus did on the cross to wherever You may send me. I choose to stand on the firm foundation of Jesus Christ and the knowledge of His saving death, burial and resurrection.");
                      },
                      child: Container(
                        width: imageWidth * 0.65,
                        child: Image.asset(
                          'lib/assets/SoilderV3/Legs.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            // Sword
            sword
                ? Transform.translate(
                    offset: Offset(imageWidth * -0.19, imageHeight * 0.125),
                    child: Transform.rotate(
                      angle: degreesToRadians(0),
                      child: GestureDetector(
                        onTap: () {
                          print('Handle sword tap');
                          onInfoPress(context, "Sword of the Spirit",
                              "I take up the sword of the Spirit, Your very Word, the offensive weapon given to me for battle, which has the power to demolish strongholds, alive, active, and sharper than any double-edged sword.");
                        },
                        child: Container(
                          width: imageWidth * 0.60,
                          child: Image.asset(
                            'lib/assets/SoilderV3/Sword.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            // Shield
            shield
                ? Transform.translate(
                    offset: Offset(imageWidth * 0.29, imageHeight * -0.057),
                    child: GestureDetector(
                      onTap: () {
                        print('Handle shield tap');
                        onInfoPress(context, "Shield of Faith",
                            "I pick up the shield of faith, with which I am able to quench every dart and arrow from the wicked who seek to destroy me spiritually, physically, mentally, or emotionally. I have confidence that God is good, faithful and true to His Word, even in times of trouble.");
                      },
                      child: Container(
                        width: imageWidth * 0.41,
                        //decoration: BoxDecoration(border: Border.all()),
                        child: Image.asset(
                          'lib/assets/SoilderV3/Sheild.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            // Helmet
            helmet
                ? Transform.translate(
                    offset: Offset(imageWidth * -0.171, imageHeight * -0.369),
                    child: GestureDetector(
                      onTap: () {
                        print('Handle helmet tap');
                        onInfoPress(context, "Helmet of Salvation",
                            "I put on the helmet of salvation, which protects my mind and thoughts, reminding me, I am forgiven, set free, saved by the grace of Christ Jesus. Lord, protect my mind and remind me that nothing can separate me from Your love.");
                      },
                      child: Container(
                        width: imageWidth * 0.355,
                        child: Image.asset(
                          'lib/assets/SoilderV3/Helmet.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
