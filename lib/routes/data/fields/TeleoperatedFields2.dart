// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields2 extends StatefulWidget {
  const TeleoperatedFields2({
    super.key,
  });

  @override
  State<TeleoperatedFields2> createState() => _TeleoperatedFields2State();
}

class _TeleoperatedFields2State extends State<TeleoperatedFields2> {
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
        //algae barge
        CounterNumberField(
            controller: TeleoperatedValues.algaeBarge,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.algaeBarge),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.algaeBarge)),
                        //algae barge
        CounterNumberField(
            controller: TeleoperatedValues.humanPlayerMisses,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.humanPlayerMisses),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.humanPlayerMisses)),
                        //algae barge
        CounterNumberField(
            controller: TeleoperatedValues.fieldCrosses,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.fieldCrosses),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.fieldCrosses)),
      ],
    );
  }
}
