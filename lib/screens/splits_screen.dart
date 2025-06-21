import "package:flutter/material.dart";

class SplitsScreen extends StatelessWidget {
  final String _muscle;

  const SplitsScreen(this._muscle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_muscle Day Workouts",
              style: TextStyle(color: Colors.white, fontSize: 34),
            ),
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
                    icon: Icon(Icons.add, color: Colors.white),
                    color: Colors.white,
                    iconSize: 24.0,
                    tooltip: "Add",
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
