// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousRightLabel1 extends StatefulWidget {
  const AutonomousRightLabel1({
    super.key,
  });

  @override
  State<AutonomousRightLabel1> createState() => _AutonomousRightLabel1State();
}

class _AutonomousRightLabel1State extends State<AutonomousRightLabel1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // start pos
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 150.0,
              padding: const EdgeInsets.only(top: 20.0, right: 30.0),
              child: const Text(
                "Start Position",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // auto mobility
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding:
                  const EdgeInsets.only(left: 65.0, top: 20.0, right: 30.0),
              child: const Text(
                "Mobility",
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
