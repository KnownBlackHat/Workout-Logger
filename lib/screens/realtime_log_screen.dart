import "package:flutter/material.dart";
import "package:workout_logger/components/stopwatch.dart";

class RLogger extends StatefulWidget {
  const RLogger({super.key});

  @override
  State<RLogger> createState() => _RLoggerState();
}

class _RLoggerState extends State<RLogger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(color: Colors.green, child: const StopWatch()),
    );
  }
}
