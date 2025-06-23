import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:workout_logger/provider/exercise_provider.dart";

class ExcerciseScreen extends StatelessWidget {
  final String _muscle;
  const ExcerciseScreen(this._muscle, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController excerciseController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 280),
          Center(
            child: const Text(
              "Add Excercise",
              style: TextStyle(color: Colors.white, fontSize: 34),
            ),
          ),
          SizedBox(height: 80),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              cursorColor: Colors.white,
              controller: excerciseController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Excercise Name',
              ),
            ),
          ),

          SizedBox(height: 40),

          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () async {
                  if (excerciseController.text.isNotEmpty) {
                    final navigator = Navigator.of(context);
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    navigator.pop();

                    try {
                      await Provider.of<ExerciseProvider>(
                        context,
                        listen: false,
                      ).addExcercise(excerciseController.text, _muscle);
                      scaffoldMessenger.showSnackBar(
                        const SnackBar(
                          content: Text("Exercise added successfully"),
                        ),
                      );
                    } catch (e) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(content: Text("Error saving exercise: $e")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Enter exercise name")),
                    );
                  }
                },
                style: ButtonStyle(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
