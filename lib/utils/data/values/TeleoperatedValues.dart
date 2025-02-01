// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TeleoperatedValues {
  static TextEditingController coralNearL1 = TextEditingController(text: "0");
  static TextEditingController coralNearL2 = TextEditingController(text: "0");
  static TextEditingController coralNearL3 = TextEditingController(text: "0");
  static TextEditingController coralNearL4 = TextEditingController(text: "0");
  static TextEditingController coralFarL1 = TextEditingController(text: "0");
  static TextEditingController coralFarL2 = TextEditingController(text: "0");
  static TextEditingController coralFarL3 = TextEditingController(text: "0");
  static TextEditingController coralFarL4 = TextEditingController(text: "0");
  static TextEditingController coralMissed = TextEditingController(text: "0");
  static TextEditingController algaeRemoved = TextEditingController(text: "0");
  static TextEditingController algaeProcessor =
      TextEditingController(text: "0");
  static TextEditingController algaeBarge = TextEditingController(text: "0");
  static TextEditingController humanPlayerMisses =
      TextEditingController(text: "0");
  static TextEditingController fieldCrosses = TextEditingController(text: "0");

  static void resetTeleopValues() {
    TeleoperatedValues.coralNearL1.text = "0";
    TeleoperatedValues.coralNearL2.text = "0";
    TeleoperatedValues.coralNearL3.text = "0";
    TeleoperatedValues.coralNearL4.text = "0";
    TeleoperatedValues.coralFarL1.text = "0";
    TeleoperatedValues.coralFarL2.text = "0";
    TeleoperatedValues.coralFarL3.text = "0";
    TeleoperatedValues.coralFarL4.text = "0";
    TeleoperatedValues.coralMissed.text = "0";
    TeleoperatedValues.algaeRemoved.text = "0";
    TeleoperatedValues.algaeProcessor.text = "0";
    TeleoperatedValues.algaeBarge.text = "0";
    TeleoperatedValues.humanPlayerMisses.text = "0";
    TeleoperatedValues.fieldCrosses.text = "0";
  }
}
