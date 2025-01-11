import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/builders/bases/CustomCheckbox.dart';

class AutonomousRow2 extends StatefulWidget {
  const AutonomousRow2({
    super.key,
  });

  @override
  State<AutonomousRow2> createState() => _AutonomousRow2State();
}

class _AutonomousRow2State extends State<AutonomousRow2> {
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
              controller: AutonomousValues.l3A,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // L
          CustomCheckbox(
              controller: AutonomousValues.l3L,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // K
          CustomCheckbox(
              controller: AutonomousValues.l3K,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 80.0)),
          // J
          CustomCheckbox(
              controller: AutonomousValues.l3J,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // I
          CustomCheckbox(
              controller: AutonomousValues.l3I,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 78.0)),
          // H
          CustomCheckbox(
              controller: AutonomousValues.l3H,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.all(0.0)),
        ],
      ),
    );
  }
}
