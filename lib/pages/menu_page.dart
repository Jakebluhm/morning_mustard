import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/menu_button_data.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class MenuPage extends HookConsumerWidget {
  MenuPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlaypenSans',
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            ref.navigationService.goToHomePage();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 173, 80, 1),
                Color.fromRGBO(0xf7, 0xd4, 0x86, 1.0),
                Color.fromRGBO(0xc5, 0xf9, 0xd7, 1.0),
              ]),
        ),
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First column with 3 items
                Expanded(
                    child: columnOfItems(ref, 0, 3, screenHeight, screenWidth)),
                SizedBox(width: screenWidth * 0.01), // spacing between columns
                // Second column with 3 items
                Expanded(
                    child: columnOfItems(ref, 3, 6, screenHeight, screenWidth)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget columnOfItems(WidgetRef ref, int start, int end, double screenHeight,
      double screenWidth) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonItems.getRange(start, end).map((item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (item.route != null) {
                  ref.navigationService.goToRoute(item.route!);
                }
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 217, 217, 217),
                        Color.fromARGB(255, 255, 255, 255)
                      ],
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                        1.0), // Match with Material borderRadius for shadow
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
