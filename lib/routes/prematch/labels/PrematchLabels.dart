// ignore_for_file: file_names
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';
import 'package:flutter/material.dart';

class PrematchLabels extends StatefulWidget {
  const PrematchLabels({
    super.key,
  });

  @override
  State<PrematchLabels> createState() => _PrematchLabelsState();
}

class _PrematchLabelsState extends State<PrematchLabels> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Auto mobility status
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 5.0),
              child: const Text(
                "Initials",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // Match number
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: const Text(
                "Match Number",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        // team number
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170.0,
              padding: const EdgeInsets.only(left: 40.0, top: 20.0),
              child: const Text(
                "Team Number",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            )),
        const SizedBox(width: 598.0),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150.0, 37.0),
              padding: const EdgeInsets.all(15),
              backgroundColor: AppStyle.textInputColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AutonomousDataRoute(title: "Auto");
              }));
            },
            child: const Text("Auto >",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
