import 'package:flutter/material.dart';
import 'widgets/rounded_rectangle_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Rectangle Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Hình Thang Đè Ra Ngoài'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: RoundedRectangleWidget(
          width: 250,
          height: 450,
          borderRadius: 35,
          showTrapezoid: true,
          trapezoidColor: Colors.orange,
          trapezoidWidth: 150,
          trapezoidHeight: 50,
          trapezoidOffsetX: 0.0,
          trapezoidOffsetY: 220.0, // Dịch xuống để 1 nửa ra ngoài
          padding: EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal.shade300,
                  Colors.teal.shade600,
                  Colors.teal.shade800,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
