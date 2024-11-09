import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/clip_art_text.dart';

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
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5.0, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5.0, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5.0, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
            Container(
              height: 125.h,
              width: imageWidth,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(17, 24, 102, 0.98),
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: ClipArtText(
                      text:
                          "I take every thought captive to the obedience of Jesus Christ, never emptying my mind, but instead thinking on whatever is True, Noble, Right, Lovely, Admirable, Excellent and Praiseworthy.",
                      fontSize: 16,
                    ),
                  )),
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
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipArtText(
                    text: "Thoughts",
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(screenWidth * 0.27, screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.05,
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipArtText(
                    text: "Feelings",
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(screenWidth * -0.27, screenHeight * 0.3),
              child: Container(
                height: screenHeight * 0.05,
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipArtText(
                    text: "Facts",
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
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipArtText(
                    text: "I CHOOSE TO LIVE BY FACTS NOT FEELINGS",
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
