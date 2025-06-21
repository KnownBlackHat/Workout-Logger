import "package:flutter/material.dart";
import "package:workout_logger/screens/workout_component.dart";

class SplitsScreen extends StatelessWidget {
  final String _muscle;

  const SplitsScreen(this._muscle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 180),
          Center(
            child: Text(
              "$_muscle Day Workouts",
              style: TextStyle(color: Colors.white, fontSize: 34),
            ),
          ),
          SizedBox(height: 80),

          Workout("test"),
          Workout("test"),
          Workout("test"),
          Workout("test"),

          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.add, color: Colors.white),
                  color: Colors.white,
                  iconSize: 24.0,
                  tooltip: "Add",
                ),
                Container(
                  margin: const EdgeInsets.only(right: 24.0),
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
