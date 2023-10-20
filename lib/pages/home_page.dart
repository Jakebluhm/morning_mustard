import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

// This will manage the name as a state
final nameProvider = StateProvider<String>((ref) => "");

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtain the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 132, 24, 1),
        leading: IconButton(
          icon: Icon(
              Icons.question_mark_outlined), // Replace with your desired icon
          onPressed: () {
            // Handle the button's press
            print("Left Icon button pressed!");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward), // Replace with your desired icon
            onPressed: () {
              // Handle the button's press
              ref.navigationService.goToMenuPage();
              print("Right Icon button pressed!");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.75,
              child: Image.asset(
                'lib/assets/Splash/looog1.imageset/New Logo.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}