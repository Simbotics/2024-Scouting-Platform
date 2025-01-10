// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AutonomousValues {
  // L1 trough sides
  static TextEditingController l1NW = TextEditingController(text: "0");
  static TextEditingController l1NE = TextEditingController(text: "0");
  static TextEditingController l1W = TextEditingController(text: "0");
  static TextEditingController l1E = TextEditingController(text: "0");
  static TextEditingController l1SW = TextEditingController(text: "0");
  static TextEditingController l1SE = TextEditingController(text: "0");

  static TextEditingController autoMobility = TextEditingController(text: "No");
  static TextEditingController autoSpeakerScored =
      TextEditingController(text: "0");
  static TextEditingController autoSpeakerMissed =
      TextEditingController(text: "0");
  static TextEditingController autoAmpScored = TextEditingController(text: "0");
  static TextEditingController autoAmpMissed = TextEditingController(text: "0");
}
