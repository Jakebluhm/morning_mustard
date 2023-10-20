import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
          title: Text('Menu'),
          backgroundColor: Color.fromRGBO(255, 132, 24, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Replace with your desired icon
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
                  Color.fromRGBO(0xf2, 0x7a, 0x7d, 1.0),
                  Color.fromRGBO(0xf7, 0xd4, 0x86, 1.0),
                  Color.fromRGBO(0xc5, 0xf9, 0xd7, 1.0),
                ]),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.55,
                  child: Image.asset(
                    'lib/assets/ACTS/lbl_walk.imageset/lbl_walk.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(150),
                  child: Container(
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Text(
                          currentText.value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: screenHeight * 0.01,
                        crossAxisSpacing: screenWidth * 0.5,
                        childAspectRatio: 1,

                        crossAxisCount: 2, // Number of columns
                        children: List.generate(8, (index) {
                          return GestureDetector(
                            onTap: () {
                              currentText.value = actsItems[index].text;
                              print("Container $index tapped!");
                            },
                            child: Image.asset(
                              actsItems[index].imagePath,
                              fit: BoxFit.scaleDown,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
