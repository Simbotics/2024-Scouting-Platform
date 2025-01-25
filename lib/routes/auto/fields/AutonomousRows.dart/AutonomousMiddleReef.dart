// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousMiddleReef extends StatefulWidget {
  const AutonomousMiddleReef({
    super.key,
  });

  @override
  State<AutonomousMiddleReef> createState() => _AutonomousRow1State();
}

class _AutonomousRow1State extends State<AutonomousMiddleReef> {
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
              'assets/images/reefscape/karthik-reef-diagram-middle-compressed.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      height: 50,
      width: 440,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
        children: [
          // left side trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 100.0, bottom: 0.0),
              controller: AutonomousValues.l1W,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1W),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1W)),
          // right side trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 0.0, top: 0.0),
              controller: AutonomousValues.l1E,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1E),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1E)),
        ],
      ),
    );
  }
}
