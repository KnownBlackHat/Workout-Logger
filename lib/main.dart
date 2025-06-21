import 'package:flutter/material.dart';
import 'package:workout_logger/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.beezer.com/wp-content/uploads/2020/06/blaaa.jpg",
              ),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),

                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Home(),
            ),
          ),
        ),
      ),
    );
  }
}
