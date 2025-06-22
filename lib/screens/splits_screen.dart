import "package:flutter/material.dart";
import "package:workout_logger/screens/add_excercise_screen.dart";
import "package:workout_logger/screens/workout_component.dart";
import "package:mongo_dart/mongo_dart.dart" hide Center;

class SplitsScreen extends StatelessWidget {
  final String _muscle;

  const SplitsScreen(this._muscle, {super.key});

  Future<List<String>> fetchExercise() async {
    try {
      final db = await Db.create(
        'mongodb+srv://test:test@cluster0.yvlq9mj.mongodb.net/workout_logger?retryWrites=true&w=majority&appName=Cluster0',
      );
      await db.open();
      final collection = db.collection('exercise');

      final exercise = await collection.find().toList();
      await db.close();
      return exercise.map((doc) => doc['name'] as String).toList();
    } catch (e) {
      print("Error fetching exercises: $e");
      return [];
    }
  }

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

          FutureBuilder(
            future: fetchExercise(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Error loading exercises",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "No exercises found",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                return Column(
                  children: snapshot.data!.map((exerciseName) {
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
                      builder: (context) => const ExcerciseScreen(),
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
