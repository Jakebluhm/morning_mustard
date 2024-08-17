import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/acts_button_data.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';

class ActsPage extends HookConsumerWidget {
  ActsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final currentText = useState('');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACTS',
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
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.04,
            ),
            SizedBox(
              width: screenWidth < screenHeight
                  ? screenWidth * 0.4
                  : screenHeight * 0.4,
              child: Image.asset(
                'lib/assets/ACTS/lbl_walk.imageset/lbl_walk.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(150),
              child: Container(
                width: screenWidth * 0.95,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Text(
                        currentText.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.spMin,
                            fontFamily: 'PlaypenSans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Adjust as needed
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: columnOfItems(
                            currentText, 0, 4, screenHeight, screenWidth)),
                    SizedBox(
                        width:
                            screenWidth * 0.03), // Some space between columns
                    Expanded(
                        child: columnOfItems(
                            currentText, 4, 8, screenHeight, screenWidth)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget columnOfItems(ValueNotifier<String> currentText, int start, int end,
      double screenHeight, double screenWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: actsItems.getRange(start, end).map((item) {
        return GestureDetector(
          onTap: () {
            currentText.value = item.text;
          },
          child: Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.4,
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.scaleDown,
            ),
          ),
        );
      }).toList(),
    );
  }
}
