import "package:flutter/material.dart";

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ExcerciseScreen()),
                  ),
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
