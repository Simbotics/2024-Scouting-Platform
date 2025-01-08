// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields extends StatefulWidget {
  const TeleoperatedFields({
    super.key,
  });

  @override
  State<TeleoperatedFields> createState() => _TeleoperatedFieldsState();
}

class _TeleoperatedFieldsState extends State<TeleoperatedFields> {
  /// Increments an integer in a controllers value by one
  void incrementNumber(TextEditingController controller) {
    if (!mounted) return;

    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
    });
  }

  /// Decrements an integer in a controllers value by one unless it's 0
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
    return Row(
      children: [
        //coral l1 scored
        CounterNumberField(
            controller: TeleoperatedValues.coralL1,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.coralL1),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.coralL1)),
        //coral l2 scored
        CounterNumberField(
            controller: TeleoperatedValues.coralL2,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.coralL2),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.coralL2)),
        //coral l3 scored
        CounterNumberField(
            controller: TeleoperatedValues.coralL3,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.coralL3),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.coralL3)),
        //coral l4 scored
        CounterNumberField(
            controller: TeleoperatedValues.coralL4,
            onTapDecrement: () => decrementNumber(TeleoperatedValues.coralL4),
            onTapIncrement: () => incrementNumber(TeleoperatedValues.coralL4)),
        //coral missed
        CounterNumberField(
            controller: TeleoperatedValues.coralMissed,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralMissed),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralMissed)),
        //algae removed
        CounterNumberField(
            controller: TeleoperatedValues.algaeRemoved,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.algaeRemoved),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.algaeRemoved)),
        //algae processor
        CounterNumberField(
            controller: TeleoperatedValues.algaeProcessor,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.algaeProcessor),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.algaeProcessor)),
      ],
    );
  }
}
