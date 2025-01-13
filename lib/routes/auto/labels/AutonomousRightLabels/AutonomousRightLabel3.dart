// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousRightLabel3 extends StatefulWidget {
  const AutonomousRightLabel3({
    super.key,
  });

  @override
  State<AutonomousRightLabel3> createState() => _AutonomousRightLabel3State();
}

class _AutonomousRightLabel3State extends State<AutonomousRightLabel3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Alage removed
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(top: 20.0, right: 0.0),
              child: const Text(
                "Algae Removed",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // processor
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 160.0,
              padding: const EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0),
              child: const Text(
                "Algae Processor",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // barge algae
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 130.0,
              padding: const EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0),
              child: const Text(
                "Algae Barge",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        const Divider(),
      ],
    );
  }
}
