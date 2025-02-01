// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EndgameValues {
  /// These don't hold the value of the stopwatch, only properties such as state and the instance
  static final TextEditingController stopwatchState =
      TextEditingController(text: "0");
  static final stopwatch = Stopwatch();

  static TextEditingController endgame = TextEditingController(text: "No");
  static TextEditingController climbTime = TextEditingController(text: "0");

  static void resetEndgameValues() {
    EndgameValues.endgame.text = "No"; // was climb, now endgame
    EndgameValues.climbTime.text = "0"; // parked was below
    EndgameValues.stopwatchState.text = "0";
    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }
}
