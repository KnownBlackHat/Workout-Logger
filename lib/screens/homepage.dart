import 'package:flutter/material.dart';
import 'splits_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "What day is today?",
          style: TextStyle(fontSize: 34.0, color: Colors.white),
        ),
        const Splits(
          "Push",
          "https://cdn.shopify.com/s/files/1/0046/1828/9223/files/Pecs_480x480.png?v=1683142473",
        ),
        const Splits(
          "Pull",
          "https://cdn.shopify.com/s/files/1/0046/1828/9223/files/Biceps_480x480.png?v=1683142513",
        ),
        const Splits(
          "Legs",
          "https://cdn.shopify.com/s/files/1/0046/1828/9223/files/Quads_480x480.png?v=1683142678",
        ),
        // Container(
        //   margin: EdgeInsetsGeometry.fromLTRB(1, 35, 1, 1),
        //   child: ElevatedButton(
        //     onPressed: null,
        //     style: ElevatedButton.styleFrom(
        //       foregroundColor: Colors.white,
        //       backgroundColor: Colors.white,
        //       padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12.0),
        //         side: BorderSide(color: Colors.white, width: 2.0),
        //       ),
        //       textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       elevation: 5,
        //     ),
        //     child: Text("Go!!", style: TextStyle(color: Colors.white)),
        //   ),
        // ),
      ],
    );
  }
}
