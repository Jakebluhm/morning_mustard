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
    double imageWidth = screenHeight * 0.25; // Width of the soldier image
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
          // Chest
          chest
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.04, imageHeight * -0.11),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle chest tap');
                      onInfoPress(context, "Breast Plate of Righteousness",
                          "When I have put on the Breast Plate of Righteousness, it will protect my heart from sinful and evil desires, for everything I do, flows out of it.");
                    },
                    child: Container(
                      width: imageWidth * 0.6,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/chest sheild.imageset/chest sheild.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Waist
          waist
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.045, imageHeight * 0.15),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle waist tap');
                      onInfoPress(context, "Belt of Truth",
                          "When I have fastened the Belt of Truth around me, it (God’s Word) will protect my mind in order to defeat Satan’s lies. His Truth shall be my standard.\nI will take every thought captive to Jesus Christ; never emptying my mind, but instead thinking of whatever is True, Noble, Right, Lovely, Admirable, Excellent and Praiseworthy.");
                    },
                    child: Container(
                      width: imageWidth * 0.30,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/waist.imageset/waist.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Legs
          legs
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.037, imageHeight * 0.345),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle legs tap');
                      onInfoPress(
                          context,
                          "Shod My Feet w/the Preparation of the Gospel",
                          "I will tie on the footgear of the Gospel of Peace, so I can stand firm in the knowledge of what the Gospel means to me and others.  My footing will be sure and unshakable, as I prepare to carry the gospel to whomever God might send me.");
                    },
                    child: Container(
                      width: imageWidth * 0.54,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/leg arms.imageset/leg arms.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Sword
          sword
              ? Transform.translate(
                  offset: Offset(imageWidth * 0.03, imageHeight * 0.3),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle sword tap');
                      onInfoPress(context, "Sword of the Spirit",
                          "I will take hold of the Sword, which is the Word of God, every moment of my life.\nI will study God’s Word, learn from it and teach it, for it is effective to demolish Satan’s strongholds.");
                    },
                    child: Container(
                      width: imageWidth * 0.96,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/sword with knob.imageset/sword with knob.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Shield
          shield
              ? Transform.translate(
                  offset: Offset(imageWidth * 0.23, imageHeight * 0.065),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle shield tap');
                      onInfoPress(context, "Shield of Faith",
                          "I will pick up the shield of faith, to put out the fires from Satan’s flaming arrows, And I will have confidence that God is good and faithful and true to His Word, even if I have trouble in my life.");
                    },
                    child: Container(
                      width: imageWidth * 0.5,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/sheild.imageset/sheild.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Helmet
          helmet
              ? Transform.translate(
                  offset: Offset(imageWidth * -0.049, imageHeight * -0.39),
                  child: GestureDetector(
                    onTap: () {
                      print('Handle helmet tap');
                      onInfoPress(context, "Helmet of Salvation",
                          "As I put on the Helmet of Salvation, I can have confidence that the troubles of my world will not compare with the glories which I will see in Heaven.");
                    },
                    child: Container(
                      width: imageWidth * 0.33,
                      child: Image.asset(
                        'lib/assets/Soilder/body parts/Helmet.imageset/Helmet.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
