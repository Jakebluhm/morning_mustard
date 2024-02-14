import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morning_mustard/constants/app_info_text.dart';

class ArmorInfoModal extends StatelessWidget {
  final String heading;
  // Add a final String field to hold the passed value
  final String infoText;

  // Constructor to initialize the infoText
  ArmorInfoModal({Key? key, required this.heading, required this.infoText})
      : super(key: key);

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
            height: screenHeight * 0.6, // Adjust this to your desired height
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: screenHeight * .02), // For spacing

                Text(
                  heading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp, // Larger font size
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.black,
                    fontFamily: 'PlaypenSans',
                  ),
                ),
                SizedBox(height: screenHeight * .1), // For spacing
                Expanded(
                  child: SingleChildScrollView(
                    // Styling for body text
                    child: Text(
                      infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp, // Larger than normal body text
                        color: Colors.black54,
                        fontFamily: 'PlaypenSans',
                        // Slightly muted color
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
