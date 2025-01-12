// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousBottomReef extends StatefulWidget {
  const AutonomousBottomReef({
    super.key,
  });

  @override
  State<AutonomousBottomReef> createState() => _AutonomousRow1State();
}

class _AutonomousRow1State extends State<AutonomousBottomReef> {
  // Increments an integer in a controller's value by one
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
              'assets/images/reefscape/karthik-reef-diagram-bottom-shorter.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      height: 95,
      width: 440,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
        children: [
          // bottom left side trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 55.0, bottom: 0.0, left: 10.0),
              controller: AutonomousValues.l1SW,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1SW),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1SW)),
          // bottom right side trough counter
          CounterNumberField(
              margin: EdgeInsets.only(right: 0.0, bottom: 0.0),
              controller: AutonomousValues.l1SE,
              onTapDecrement: () => decrementNumber(AutonomousValues.l1SE),
              onTapIncrement: () => incrementNumber(AutonomousValues.l1SE)),
        ],
      ),
    );
  }
}
