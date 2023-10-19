import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class MenuPage extends HookConsumerWidget {
  MenuPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
        decoration: BoxDecoration(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              mainAxisSpacing: screenHeight / 12,
              crossAxisSpacing: screenWidth / 30,

              crossAxisCount: 2, // Number of columns
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    print("Container $index tapped!");
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional for rounded edges
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 231, 235, 237),
                            Color.fromARGB(255, 255, 255, 255)
                          ],
                        ),
                        border: Border.all(
                          color: Colors.black, // Border Color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // Match with Material borderRadius for shadow
                      ),
                      width: screenWidth * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/assets/menu/menu_acts.imageset/menu_acts.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
