import 'package:flutter/material.dart';
import 'package:morning_mustard/constants/app_info_text.dart';

class AppInfoModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.8, // Adjust this to your desired height
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20), // For spacing
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      appInfoText,
                      style: TextStyle(
                        fontFamily: 'Kalam',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Close the modal
              },
            ),
          ),
        ],
      ),
    );
  }
}
