import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
            Transform.translate(
              offset: Offset(0, screenHeight * 0.1),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(17, 24, 102, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: screenHeight * 0.15,
                width: imageWidth,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'lib/assets/Thought/I Take my Thoughts  Captive to the  Obedience of Jesus.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            //Blue bar for words
            Transform.translate(
              offset: Offset(0, screenHeight * 0.3),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(17, 24, 102, 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: screenHeight * 0.05,
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
            )
          ],
        ),
      ),
    );
  }
}
