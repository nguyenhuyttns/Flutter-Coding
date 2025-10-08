import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Notched Frame App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(
          width: 300,
          height: 500,
          child: CustomNotchedFrame(
            backgroundColor: Colors.black,
            borderRadius: 25.0,
            notchWidth: 100.0,
            notchHeight: 25.0,
            trapezoidWidth: 70.0,
            trapezoidHeight: 12.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      size: 50,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Custom Frame',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'With Notch & Trapezoid',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNotchedFrame extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  final double borderRadius;
  final double notchWidth;
  final double notchHeight;
  final double trapezoidWidth;
  final double trapezoidHeight;

  const CustomNotchedFrame({
    Key? key,
    this.child,
    this.backgroundColor = Colors.white,
    this.borderRadius = 20.0,
    this.notchWidth = 120.0,
    this.notchHeight = 30.0,
    this.trapezoidWidth = 80.0,
    this.trapezoidHeight = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _NotchedFramePainter(
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        notchWidth: notchWidth,
        notchHeight: notchHeight,
        trapezoidWidth: trapezoidWidth,
        trapezoidHeight: trapezoidHeight,
      ),
      child: Container(
        margin: EdgeInsets.all(borderRadius),
        child: child,
      ),
    );
  }
}

class _NotchedFramePainter extends CustomPainter {
  final Color backgroundColor;
  final double borderRadius;
  final double notchWidth;
  final double notchHeight;
  final double trapezoidWidth;
  final double trapezoidHeight;

  _NotchedFramePainter({
    required this.backgroundColor,
    required this.borderRadius,
    required this.notchWidth,
    required this.notchHeight,
    required this.trapezoidWidth,
    required this.trapezoidHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Bắt đầu từ góc trên bên trái (sau notch)
    path.moveTo(borderRadius + notchWidth / 2, 0);

    // Vẽ notch (tai thỏ) ở giữa trên
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, notchHeight / 2),
        width: notchWidth,
        height: notchHeight,
      ),
      -pi,
      pi,
      false,
    );

    // Đường đến góc trên bên phải
    path.lineTo(size.width - borderRadius, 0);

    // Bo góc trên bên phải
    path.arcTo(
      Rect.fromLTWH(
        size.width - borderRadius * 2,
        0,
        borderRadius * 2,
        borderRadius * 2,
      ),
      -pi / 2,
      pi / 2,
      false,
    );

    // Đường đến góc dưới bên phải
    path.lineTo(size.width - borderRadius, size.height - borderRadius - trapezoidHeight);

    // Bo góc dưới bên phải
    path.arcTo(
      Rect.fromLTWH(
        size.width - borderRadius * 2,
        size.height - borderRadius * 2 - trapezoidHeight,
        borderRadius * 2,
        borderRadius * 2,
      ),
      0,
      pi / 2,
      false,
    );

    // Vẽ hình thang ngược ở dưới
    final trapezoidLeft = (size.width - trapezoidWidth) / 2;
    final trapezoidRight = trapezoidLeft + trapezoidWidth;
    
    path.lineTo(trapezoidRight, size.height - trapezoidHeight);
    path.lineTo(trapezoidRight - trapezoidWidth * 0.3, size.height);
    path.lineTo(trapezoidLeft + trapezoidWidth * 0.3, size.height);
    path.lineTo(trapezoidLeft, size.height - trapezoidHeight);

    // Đường đến góc dưới bên trái
    path.lineTo(borderRadius, size.height - borderRadius - trapezoidHeight);

    // Bo góc dưới bên trái
    path.arcTo(
      Rect.fromLTWH(
        0,
        size.height - borderRadius * 2 - trapezoidHeight,
        borderRadius * 2,
        borderRadius * 2,
      ),
      pi / 2,
      pi / 2,
      false,
    );

    // Đường đến góc trên bên trái
    path.lineTo(0, borderRadius);

    // Bo góc trên bên trái
    path.arcTo(
      Rect.fromLTWH(0, 0, borderRadius * 2, borderRadius * 2),
      pi,
      pi / 2,
      false,
    );

    // Vẽ thanh ngang trên notch
    final notchLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final notchLineY = notchHeight * 0.6;
    canvas.drawLine(
      Offset(size.width / 2 - notchWidth * 0.2, notchLineY),
      Offset(size.width / 2 + notchWidth * 0.2, notchLineY),
      notchLinePaint,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}