import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:workout_logger/provider/exercise_provider.dart";
import "package:workout_logger/screens/add_excercise_screen.dart";
import "package:workout_logger/screens/workout_component.dart";

class SplitsScreen extends StatelessWidget {
  final String _muscle;

  const SplitsScreen(this._muscle, {super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExerciseProvider>(
        context,
        listen: false,
      ).fetchExercise(_muscle);
    });
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

          Consumer<ExerciseProvider>(
            builder: (context, provider, child) {
              // provider.fetchExercise(_muscle);
              if (provider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (provider.error != null) {
                return const Center(
                  child: Text(
                    "Error loading exercises",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              } else if (provider.exercises.isEmpty) {
                return const Center(
                  child: Text(
                    "No exercises found",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                return Column(
                  children: provider.exercises.map((exerciseName) {
                    return Workout(exerciseName);
                  }).toList(),
                );
              }
            },
          ),

          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ExcerciseScreen(_muscle),
                    ),
                  ),
                },
                style: ButtonStyle(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 24),
                    SizedBox(width: 10),
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
