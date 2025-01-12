// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousTopReef extends StatefulWidget {
  const AutonomousTopReef({
    super.key,
  });

  @override
  State<AutonomousTopReef> createState() => _AutonomousRow1State();
}

class _AutonomousRow1State extends State<AutonomousTopReef> {
  /// Increments an integer in a controller's value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controller's value by one unless it's 0
  void decrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue--;
      controller.text = (currentValue > 0 ? currentValue : 0).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/reefscape/karthik-reef-diagram-top-shorter.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      height: 95,
      width: 440,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
        children: [
          // North West (Top Left) trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 50.0, bottom: 20.0, left: 45.0),
              controller: AutonomousValues.l1NW,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1NW),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1NW)),
          // North East (Top Right) trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 40.0, bottom: 20.0),
              controller: AutonomousValues.l1NE,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1NE),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1NE)),
        ],
      ),
    );
  }
}
