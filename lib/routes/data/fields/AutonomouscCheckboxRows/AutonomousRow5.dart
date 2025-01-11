import 'package:flutter/material.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/builders/bases/CustomCheckbox.dart';

class AutonomousRow5 extends StatefulWidget {
  const AutonomousRow5({
    super.key,
  });

  @override
  State<AutonomousRow5> createState() => _AutonomousRow5State();
}

class _AutonomousRow5State extends State<AutonomousRow5> {
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
          // B
          CustomCheckbox(
              controller: AutonomousValues.l3B,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // C
          CustomCheckbox(
              controller: AutonomousValues.l3C,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // D
          CustomCheckbox(
              controller: AutonomousValues.l3D,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 80.0)),
          // E
          CustomCheckbox(
              controller: AutonomousValues.l3E,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 75.0)),
          // F
          CustomCheckbox(
              controller: AutonomousValues.l3F,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 78.0)),
          // G
          CustomCheckbox(
              controller: AutonomousValues.l3G,
              backgroundColor: Colors.grey.shade800,
              checkColor: Colors.white,
              labelColor: Colors.white,
              margin: const EdgeInsets.only(right: 0.0)),
        ],
      ),
    );
  }
}
