import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class ThoughtsPage extends HookConsumerWidget {
  ThoughtsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textState = useState<String>('');
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageHeight = screenHeight * 0.8;
    double imageWidth = imageHeight * 0.7747;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thoughts',
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
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, screenHeight * -0.13),
              child: Container(
                width: imageWidth,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/Jesus.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, screenHeight * -0.15),
              child: Container(
                width: imageWidth,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth * .15, left: screenWidth * .15),
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'PlaypenSans',
                    ),
                    onChanged: (newText) {
                      textState.value = newText; // Updating the state
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/assets/Thought/chain.png',
                  fit: BoxFit.contain,
                  height: imageHeight,
                ),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(17, 24, 102, 0.98),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   'lib/assets/Thought/I Take my Thoughts  Captive to the  Obedience of Jesus.png',
                      //   fit: BoxFit.contain,
                      // ),
                      Stack(
                        children: <Widget>[
                          // Outline text
                          Text(
                            "I take every thought captive to the obedience of Jesus Christ, never emptying my mind, but instead thinking on whatever is True, Noble, Right, Lovely, Admirable, Excellent and Praiseworthy.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 18,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Color.fromARGB(255, 141, 65, 11),
                              shadows: [
                                Shadow(
                                  offset: Offset(0.0, -0.5),
                                  blurRadius: 15.0,
                                  color: Colors.black.withOpacity(0.95),
                                ),
                              ],
                            ),
                          ),
                          // Filled text
                          const Text(
                            "I take every thought captive to the obedience of Jesus Christ, never emptying my mind, but instead thinking on whatever is True, Noble, Right, Lovely, Admirable, Excellent and Praiseworthy.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 18,
                              color: Color.fromRGBO(248, 228, 152,
                                  1), // Change to your desired fill color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Blue bar for words
            Transform.translate(
              offset: Offset(0, screenHeight * 0.35),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(17, 24, 102, 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: screenHeight * 0.15,
                  width: imageWidth,
                  child: Container()),
            ),
            // Words
            Transform.translate(
              offset: Offset(0, screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.05,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/Thoughts.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(screenWidth * 0.27, screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.05,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/Feelings.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(screenWidth * -0.27, screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.05,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/fact.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Trains
            Transform.translate(
              offset: Offset(screenWidth * -0.27, screenHeight * 0.225),
              child: Container(
                height: screenHeight * 0.11,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/t1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, screenHeight * 0.225),
              child: Container(
                height: screenHeight * 0.11,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/t2.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(screenWidth * 0.27, screenHeight * 0.225),
              child: Container(
                height: screenHeight * 0.11,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/t3.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 32.0.h, left: 8.0.w, right: 8.0.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    // Outline text
                    Text(
                      "I choose to live by Truth not by feelings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PlaypenSans',
                        letterSpacing: 2,
                        fontSize: 18,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Color.fromARGB(255, 141, 65, 11),
                        shadows: [
                          Shadow(
                            offset: Offset(0.0, -0.5),
                            blurRadius: 15.0,
                            color: Colors.black.withOpacity(0.95),
                          ),
                        ],
                      ),
                    ),
                    // Filled text
                    const Text(
                      "I choose to live by Truth not by feelings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PlaypenSans',
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Color.fromRGBO(248, 228, 152,
                            1), // Change to your desired fill color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
