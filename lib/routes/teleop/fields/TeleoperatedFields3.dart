// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class TeleoperatedFields3 extends StatefulWidget {
  const TeleoperatedFields3({
    super.key,
  });

  @override
  State<TeleoperatedFields3> createState() => _TeleoperatedFields3State();
}

class _TeleoperatedFields3State extends State<TeleoperatedFields3> {
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
        // coral near l3
        CounterNumberField(
            controller: TeleoperatedValues.coralNearL3,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralNearL3),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralNearL3)),
        // coral far l3
        CounterNumberField(
            controller: TeleoperatedValues.coralFarL3,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.coralFarL3),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.coralFarL3)),
        // algae processor
        CounterNumberField(
            controller: TeleoperatedValues.algaeProcessor,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.algaeProcessor),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.algaeProcessor)),
        // human player misses
        CounterNumberField(
            controller: TeleoperatedValues.humanPlayerMisses,
            onTapDecrement: () =>
                decrementNumber(TeleoperatedValues.humanPlayerMisses),
            onTapIncrement: () =>
                incrementNumber(TeleoperatedValues.humanPlayerMisses)),
        //climb time
        StopwatchButton(
          value: EndgameValues.climbTime,
          state: EndgameValues.stopwatchState,
          timer: EndgameValues.stopwatch,
        ),
      ],
    );
  }
}
