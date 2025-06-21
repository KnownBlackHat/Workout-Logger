import "package:flutter/material.dart";
import "package:workout_logger/screens/splits_screen.dart";

class Splits extends StatelessWidget {
  final String _muscle;
  final String _img;

  const Splits(this._muscle, this._img, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => SplitsScreen(_muscle)));
      },
      style: ButtonStyle(backgroundColor: WidgetStateColor.transparent),
      child: Column(
        children: [
          Image.network(_img, scale: 2.0),
          Text(_muscle, style: TextStyle(fontSize: 24.0, color: Colors.white)),
        ],
      ),
    );
  }
}
