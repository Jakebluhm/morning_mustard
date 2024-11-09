import 'package:flutter/material.dart';

class ClipArtText extends StatelessWidget {
  const ClipArtText({
    required this.text,
    this.fontSize = 18, // Optional parameter with default value 18
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize; // Store the font size

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          // Outline text
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlaypenSans',
              letterSpacing: 2,
              fontSize: fontSize, // Use the fontSize passed in the constructor
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Color.fromARGB(255, 141, 65, 11),
              shadows: [
                Shadow(
                  offset: Offset(0.0, -0.5),
                  blurRadius: 15.0,
                  color: Colors.black.withOpacity(0.95),
                ),
              ],
            ),
          ),
          // Filled text
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlaypenSans',
              letterSpacing: 2,
              fontSize: fontSize, // Use the fontSize passed in the constructor
              color: Color.fromRGBO(
                  248, 228, 152, 1), // Change to your desired fill color
            ),
          ),
        ],
      );
}
