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
        //coral l1 near scored
        CounterNumberField(
            controller: TeleoperatedValues.coralNearL1,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralNearL1),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralNearL1)),
        //coral l1 far scored
        CounterNumberField(
            controller: TeleoperatedValues.coralFarL1,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralFarL1),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralFarL1)),
        //coral missed
        CounterNumberField(
            controller: TeleoperatedValues.coralMissed,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralMissed),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralMissed)),
      ],
    );
  }
}
