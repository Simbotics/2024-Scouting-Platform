// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';

class AutonomousRightRow3 extends StatefulWidget {
  const AutonomousRightRow3({
    super.key,
  });

  @override
  State<AutonomousRightRow3> createState() => _AutonomousRightRow3State();
}

class _AutonomousRightRow3State extends State<AutonomousRightRow3> {
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
      height: 60, // Set a height for the container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row contents
        children: [
          // Algae removed from reef counter
          CounterNumberField(
              margin: EdgeInsets.zero,
              controller: AutonomousValues.algaeRemoved,
              onTapIncrement: () =>
                  incrementNumber(AutonomousValues.algaeRemoved),
              onTapDecrement: () =>
                  decrementNumber(AutonomousValues.algaeRemoved)),
          // Algae scored in processor counter
          CounterNumberField(
              margin: EdgeInsets.only(left: 10),
              controller: AutonomousValues.algaeProcessor,
              onTapIncrement: () =>
                  incrementNumber(AutonomousValues.algaeProcessor),
              onTapDecrement: () =>
                  decrementNumber(AutonomousValues.algaeProcessor)),
          // Algae scored in barge counter
          CounterNumberField(
              margin: EdgeInsets.only(left: 10),
              controller: AutonomousValues.algaeBarge,
              onTapIncrement: () =>
                  incrementNumber(AutonomousValues.algaeBarge),
              onTapDecrement: () =>
                  decrementNumber(AutonomousValues.algaeBarge)),
        ],
      ),
    );
  }
}
