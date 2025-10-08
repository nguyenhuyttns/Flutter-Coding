import 'package:flutter/material.dart';

class RoundedRectangleWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final double borderWidth;
  final Color borderColor;
  final bool hasShadow;
  final bool showTrapezoid;
  final Color trapezoidColor;
  final double trapezoidWidth;
  final double trapezoidHeight;
  final double trapezoidOffsetX;
  final double trapezoidOffsetY;
  final EdgeInsets padding;

  const RoundedRectangleWidget({
    Key? key,
    required this.child,
    this.width = 200,
    this.height = 300,
    this.borderRadius = 15.0,
    this.backgroundColor = const Color(0xFF2D3E3F),
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.hasShadow = false,
    this.showTrapezoid = false,
    this.trapezoidColor = const Color(0xFF4CAF50),
    this.trapezoidWidth = 120,
    this.trapezoidHeight = 60,
    this.trapezoidOffsetX = 0.0,
    this.trapezoidOffsetY = 0.0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        // Tạo không gian rộng hơn để hình thang có thể hiển thị ra ngoài
        width: width + trapezoidWidth + trapezoidOffsetX.abs(),
        height: height + trapezoidHeight + trapezoidOffsetY.abs(),
        child: Stack(
          clipBehavior: Clip.none, // Cho phép hiển thị ra ngoài Stack
          children: [
            // Hình chữ nhật chính - căn giữa trong SizedBox
            Positioned(
              left: showTrapezoid ? (trapezoidWidth + trapezoidOffsetX.abs()) / 2 : 0,
              top: showTrapezoid ? (trapezoidHeight + trapezoidOffsetY.abs()) / 2 : 0,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: borderWidth > 0 
                      ? Border.all(color: borderColor, width: borderWidth)
                      : null,
                  boxShadow: hasShadow
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: child,
                ),
              ),
            ),
            
            // Hình thang - có thể đè ra ngoài
            if (showTrapezoid)
              Positioned(
                left: (width + trapezoidWidth + trapezoidOffsetX.abs()) / 2 - trapezoidWidth / 2 + trapezoidOffsetX,
                top: (height + trapezoidHeight + trapezoidOffsetY.abs()) / 2 - trapezoidHeight / 2 + trapezoidOffsetY,
                child: CustomPaint(
                  size: Size(trapezoidWidth, trapezoidHeight),
                  painter: TrapezoidPainter(
                    color: trapezoidColor,
                    hasShadow: true,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  final Color color;
  final bool hasShadow;

  TrapezoidPainter({
    required this.color,
    this.hasShadow = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Hình thang: đáy trên dài hơn đáy dưới
    final topWidth = size.width;
    final bottomWidth = size.width * 0.6;
    final offset = (topWidth - bottomWidth) / 2;
    
    // Vẽ hình thang
    path.moveTo(offset, size.height); // Góc trái dưới
    path.lineTo(size.width - offset, size.height); // Góc phải dưới
    path.lineTo(size.width, 0); // Góc phải trên
    path.lineTo(0, 0); // Góc trái trên
    path.close();
    
    // Vẽ shadow nếu có
    if (hasShadow) {
      canvas.drawShadow(path, Colors.black.withOpacity(0.3), 4.0, false);
    }
    
    // Vẽ hình thang
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
