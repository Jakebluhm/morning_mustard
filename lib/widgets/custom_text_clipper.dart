import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircleTextWrapper extends StatelessWidget {
  const CircleTextWrapper({
    Key? key,
    this.radius = 110,
    this.text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
    this.textStyle = const TextStyle(fontSize: 20),
    this.startAngle = 0,
  }) : super(key: key);
  final double radius;
  final String text;
  final double startAngle;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _Painter(
          radius,
          text,
          textStyle,
        ),
      );
}

class _Painter extends CustomPainter {
  _Painter(this.radius, this.text, this.textStyle, {this.padding = 12});
  final double radius;
  final String text;
  final double padding;

  final TextStyle textStyle;
  final _textPainter = TextPainter(textDirection: TextDirection.ltr);
  final Paint _paint = Paint()
    ..blendMode
    ..color = Colors.white
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, radius + padding, _paint);

    String lineText = "";
    _textPainter.text = TextSpan(text: lineText, style: textStyle);
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    double y = -radius + _textPainter.height * .6;
    double x = math.sqrt(radius * radius - y * y);
    for (int i = 0; i < text.length; i++) {
      lineText += text[i];
      _textPainter.text = TextSpan(text: lineText, style: textStyle);
      _textPainter.layout(
        minWidth: 0,
        maxWidth: double.maxFinite,
      );

      if (_textPainter.width >=
          (Offset(-x, y) - Offset(x, y)).distance - textStyle.fontSize! * .5) {
        _textPainter.paint(canvas, Offset(-x, y - _textPainter.height * .6));
        // canvas.drawLine(Offset(-x, y), Offset(x, y), _paint);
        y += _textPainter.height;
        x = math.sqrt(radius * radius - y * y);
        lineText = "";
      }

      if (i == text.length - 1) {
        _textPainter.paint(canvas, Offset(-x, y - _textPainter.height * .6));
        //  canvas.drawLine(Offset(-x, y), Offset(x, y), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
