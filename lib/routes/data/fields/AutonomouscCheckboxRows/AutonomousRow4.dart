import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/builders/bases/CustomCheckbox.dart';

class AutonomousRow4 extends StatefulWidget {
  const AutonomousRow4({
    super.key,
  });

  @override
  State<AutonomousRow4> createState() => _AutonomousRow4State();
}

class _AutonomousRow4State extends State<AutonomousRow4> {
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
      decoration: BoxDecoration(),
      height: 50, // Set a height for the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          // A
          CustomCheckbox(
              controller: AutonomousValues.l4B,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // L
          CustomCheckbox(
              controller: AutonomousValues.l4C,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // K
          CustomCheckbox(
              controller: AutonomousValues.l4D,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 80.0)),
          // J
          CustomCheckbox(
              controller: AutonomousValues.l4E,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // I
          CustomCheckbox(
              controller: AutonomousValues.l4F,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 78.0)),
          // H
          CustomCheckbox(
              controller: AutonomousValues.l4G,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 0.0)),
        ],
      ),
    );
  }
}
