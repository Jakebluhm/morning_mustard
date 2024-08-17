import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  final double padding;

  HeartClipper({this.padding = 16.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width - padding * 2;
    final double height = size.height - padding * 2;

    // Define the heart shape path with padding
    path.moveTo(padding + width / 2, padding + height / 3.5);

    path.cubicTo(
        padding + width * 1.05, // Adjusted to make the heart more narrow
        padding + height * 0.05, // Adjusted to raise the peaks higher
        padding + width * 1.05, // Adjusted to make the heart more narrow
        padding + height * 0.6,
        padding + width / 2,
        padding + height * 0.8 // End point (shortened)
        );

    path.cubicTo(
        padding + width * -0.05, // Adjusted to make the heart more narrow
        padding + height * 0.6,
        padding + width * -0.05, // Adjusted to make the heart more narrow
        padding + height * 0.05, // Adjusted to raise the peaks higher
        padding + width / 2,
        padding + height / 3.5 // Adjusted to lower the trough
        );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HeartTextOverlay extends StatelessWidget {
  final String text;

  HeartTextOverlay({required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'lib/assets/heart/heart.imageset/heart.png', // Your heart-shaped image
            ),
            ClipPath(
              clipper: HeartClipper(padding: 16.0),
              child: Container(
                height: constraints.maxHeight, // Match the height of the image
                width: constraints.maxWidth, // Match the width of the image
                color: Colors.black.withOpacity(
                    0.5), // Background color for better text visibility
                child: Padding(
                  padding: EdgeInsets.all(16.0), // Adjust padding if necessary
                  child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
