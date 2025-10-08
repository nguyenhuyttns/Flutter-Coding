import 'package:flutter/material.dart';

class PhoneFrameWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color frameColor;
  final Color standColor;
  final double borderRadius;
  final double notchWidth;

  const PhoneFrameWidget({
    Key? key,
    required this.child,
    this.width = 200,
    this.height = 350,
    this.frameColor = const Color(0xFF2D3E3F),
    this.standColor = const Color(0xFF4CAF50),
    this.borderRadius = 15.0,
    this.notchWidth = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + 40,
      height: height + 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Chân đế hình thang
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: Size(width * 0.8, 40),
              painter: TrapezoidPainter(color: standColor),
            ),
          ),
          
          // Khung điện thoại chính
          Positioned(
            top: 20,
            child: Container(
              width: width,
              height: height,
              child: CustomPaint(
                painter: PhoneFramePainter(
                  color: frameColor,
                  borderRadius: borderRadius,
                  notchWidth: notchWidth,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 40,
                    bottom: 15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius - 2),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneFramePainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  final double notchWidth;

  PhoneFramePainter({
    required this.color,
    this.borderRadius = 15.0,
    this.notchWidth = 0.3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Tính toán vị trí tai thỏ
    final notchStart = size.width * (0.5 - notchWidth / 2);
    final notchEnd = size.width * (0.5 + notchWidth / 2);
    final notchDepth = 20.0;
    final notchRadius = 10.0;
    
    // Bắt đầu từ góc trái dưới
    path.moveTo(borderRadius, size.height);
    
    // Cạnh trái
    path.lineTo(0, size.height - borderRadius);
    path.arcToPoint(
      Offset(borderRadius, size.height - borderRadius * 2),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(0, borderRadius * 2);
    path.arcToPoint(
      Offset(borderRadius, borderRadius),
      radius: Radius.circular(borderRadius),
    );
    
    // Cạnh trên trái (trước tai thỏ)
    path.lineTo(notchStart - notchRadius, borderRadius);
    
    // Tai thỏ - góc trái
    path.arcToPoint(
      Offset(notchStart, borderRadius + notchRadius),
      radius: Radius.circular(notchRadius),
    );
    
    // Tai thỏ - cạnh trái
    path.lineTo(notchStart, notchDepth - notchRadius);
    
    // Tai thỏ - góc trên trái
    path.arcToPoint(
      Offset(notchStart + notchRadius, notchDepth),
      radius: Radius.circular(notchRadius),
    );
    
    // Tai thỏ - cạnh trên
    path.lineTo(notchEnd - notchRadius, notchDepth);
    
    // Tai thỏ - góc trên phải
    path.arcToPoint(
      Offset(notchEnd, notchDepth - notchRadius),
      radius: Radius.circular(notchRadius),
    );
    
    // Tai thỏ - cạnh phải
    path.lineTo(notchEnd, borderRadius + notchRadius);
    
    // Tai thỏ - góc phải
    path.arcToPoint(
      Offset(notchEnd + notchRadius, borderRadius),
      radius: Radius.circular(notchRadius),
    );
    
    // Cạnh trên phải (sau tai thỏ)
    path.lineTo(size.width - borderRadius, borderRadius);
    
    // Góc phải trên
    path.arcToPoint(
      Offset(size.width, borderRadius * 2),
      radius: Radius.circular(borderRadius),
    );
    
    // Cạnh phải
    path.lineTo(size.width, size.height - borderRadius * 2);
    path.arcToPoint(
      Offset(size.width - borderRadius, size.height - borderRadius),
      radius: Radius.circular(borderRadius),
    );
    
    // Cạnh dưới
    path.lineTo(borderRadius, size.height - borderRadius);
    
    // Góc trái dưới
    path.arcToPoint(
      Offset(0, size.height - borderRadius * 2),
      radius: Radius.circular(borderRadius),
    );
    
    path.close();
    
    // Vẽ shadow trước
    canvas.drawShadow(path, Colors.black.withOpacity(0.3), 8.0, false);
    
    // Vẽ khung
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrapezoidPainter extends CustomPainter {
  final Color color;

  TrapezoidPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Hình thang: đáy trên dài hơn đáy dưới
    final topWidth = size.width;
    final bottomWidth = size.width * 0.7;
    final offset = (topWidth - bottomWidth) / 2;
    
    path.moveTo(offset, size.height); // Góc trái dưới
    path.lineTo(size.width - offset, size.height); // Góc phải dưới
    path.lineTo(size.width, 0); // Góc phải trên
    path.lineTo(0, 0); // Góc trái trên
    path.close();
    
    // Vẽ shadow trước
    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 4.0, false);
    
    // Vẽ chân đế
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
