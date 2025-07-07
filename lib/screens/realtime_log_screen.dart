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
      body: Column(
        children: [
          const StopWatch(),
          const SizedBox(height: 80),
          Text(
            'Pr section',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 200),
          Text(
            'log current',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
