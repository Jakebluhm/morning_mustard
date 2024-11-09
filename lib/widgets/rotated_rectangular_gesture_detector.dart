import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RotatedRectangleGestureDetector extends StatelessWidget {
  final double width;
  final double height;
  final double rotationAngle; // In radians
  final Widget child;
  final void Function() onTap;

  RotatedRectangleGestureDetector({
    required this.width,
    required this.height,
    required this.rotationAngle,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _CustomHitTestWidget(
      width: width,
      height: height,
      rotationAngle: rotationAngle,
      isInBounds: _isPointInRotatedRect,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapUp: (details) {
          if (_isPointInRotatedRect(details.localPosition)) {
            onTap();
          }
        },
        child: CustomPaint(
          painter: RotatedRectanglePainter(width, height, rotationAngle),
          child: child,
        ),
      ),
    );
  }

  bool _isPointInRotatedRect(Offset point) {
    final center = Offset(width / 2 - 45.w, height / 2 - 50.w);
    final rotatedPoint = _rotatePoint(point - center, -rotationAngle) + center;
    final result = rotatedPoint.dx >= 0 &&
        rotatedPoint.dx <= width &&
        rotatedPoint.dy >= 0 &&
        rotatedPoint.dy <= height;
    print(result);
    return result;
  }

  Offset _rotatePoint(Offset point, double angle) {
    final cosAngle = cos(angle);
    final sinAngle = sin(angle);
    return Offset(
      point.dx * cosAngle - point.dy * sinAngle,
      point.dx * sinAngle + point.dy * cosAngle,
    );
  }
}

class _CustomHitTestWidget extends SingleChildRenderObjectWidget {
  final double width;
  final double height;
  final double rotationAngle;
  final bool Function(Offset) isInBounds;

  _CustomHitTestWidget({
    required Widget child,
    required this.width,
    required this.height,
    required this.rotationAngle,
    required this.isInBounds,
  }) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _CustomHitTestRenderBox(
      width: width,
      height: height,
      rotationAngle: rotationAngle,
      isInBounds: isInBounds,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _CustomHitTestRenderBox renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..rotationAngle = rotationAngle
      ..isInBounds = isInBounds;
  }
}

class _CustomHitTestRenderBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  double width;
  double height;
  double rotationAngle;
  bool Function(Offset) isInBounds;

  _CustomHitTestRenderBox({
    required this.width,
    required this.height,
    required this.rotationAngle,
    required this.isInBounds,
  });

  @override
  void performLayout() {
    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = child!.size;
    } else {
      size = constraints.biggest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (!isInBounds(position)) {
      return false;
    }
    if (child != null && child!.hitTest(result, position: position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }
}

class RotatedRectanglePainter extends CustomPainter {
  final double width;
  final double height;
  final double rotationAngle;

  RotatedRectanglePainter(this.width, this.height, this.rotationAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    final rect =
        Rect.fromCenter(center: Offset(0, 0), width: width, height: height);

    final paint = Paint()..color = Colors.blue.withOpacity(0.00);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
