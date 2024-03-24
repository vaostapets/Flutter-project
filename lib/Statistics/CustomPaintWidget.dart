import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintWidget extends StatefulWidget {
  final double percentage;
  const CustomPaintWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  _CustomPaintWidget createState() => _CustomPaintWidget();
}

class _CustomPaintWidget extends State<CustomPaintWidget> {

  Color getFreeColor(){
    if(widget.percentage <= 0.3){
        return Colors.pink;
    }
    if(widget.percentage <= 0.6 && widget.percentage > 0.3){
      return Colors.orangeAccent;
    }
    if(widget.percentage <= 1 && widget.percentage > 0.6){
      return Colors.cyan;
    }
    return Colors.deepPurple;
  }

  Color getLineColor(){
    if(widget.percentage < 0.2){
      return Colors.deepOrangeAccent;
    }
    if(widget.percentage <= 0.6 && widget.percentage > 0.3){
      return Colors.limeAccent;
    }
    if(widget.percentage <= 1 && widget.percentage > 0.6){
      return Colors.cyanAccent;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 100,
          height: 100,
          child: RadialPercentWidget(
            percent: widget.percentage,
            fillColor: Colors.black,
            lineColor: getLineColor(),
            freeColor: getFreeColor(),
            lineWidth: 5,
            child: Text(
                (widget.percentage*100).toString() + '%',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;

    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;

    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = 3;
    final offest = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offest, offest) &
    Size(size.width - offest * 2, size.height - offest * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
