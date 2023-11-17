import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThoughtsPage extends HookConsumerWidget {
  ThoughtsPage();
//          lib/assets/Thought/chain.png
//          lib/assets/Thought/fact.png
//          lib/assets/Thought/Feelings.png
//          lib/assets/Thought/I Take my Thoughts  Captive to the  Obedience of Jesus.png
//          lib/assets/Thought/Jesus.png
//          lib/assets/Thought/Shape 2.png
//          lib/assets/Thought/t1.png
//          lib/assets/Thought/t2.png
//          lib/assets/Thought/t3.png
//          lib/assets/Thought/Thoughts.png
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageHeight = screenHeight * 0.8;
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'lib/assets/Thought/chain.png',
            fit: BoxFit.contain,
            height: imageHeight,
          ),
        ),
        Transform.translate(
          offset: Offset(0, screenHeight * 0.1),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(17, 24, 102, 1), border: Border.all()),
            height: screenHeight * 0.15,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/Thought/I Take my Thoughts  Captive to the  Obedience of Jesus.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, screenHeight * 0.3),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(17, 24, 102, 1), border: Border.all()),
            height: screenHeight * 0.05,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/Thought/Thoughts.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
