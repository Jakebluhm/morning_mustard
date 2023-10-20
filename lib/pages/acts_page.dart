import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class ActsPage extends HookConsumerWidget {
  ActsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          backgroundColor: Color.fromRGBO(255, 132, 24, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Replace with your desired icon
            onPressed: () {
              ref.navigationService.goToHomePage();
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
                  Color.fromRGBO(0xf2, 0x7a, 0x7d, 1.0),
                  Color.fromRGBO(0xf7, 0xd4, 0x86, 1.0),
                  Color.fromRGBO(0xc5, 0xf9, 0xd7, 1.0),
                ]),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  width: screenWidth * 0.55,
                  child: Image.asset(
                    'lib/assets/ACTS/lbl_walk.imageset/lbl_walk.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Center(
                    child: Text("..."),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container tapped!");
                          },
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            child: Image.asset(
                              'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
