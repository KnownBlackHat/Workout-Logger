import "package:flutter/material.dart";

class SplitsScreen extends StatelessWidget {
  final String _muscle;

  const SplitsScreen(this._muscle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(_muscle, style: TextStyle(color: Colors.white));
  }
}
