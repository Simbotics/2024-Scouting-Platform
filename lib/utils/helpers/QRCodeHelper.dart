// ignore_for_file: file_names
import 'dart:convert';

import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/data/constants/OptionConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class QrcodeHelper {
  /// Returns a string that represents the contents of the QR code that will be generated and separates them with a "^" character
  static String getQRCodeString() {
    var computedValues = computeValues([
      computePrematchValues(),
      computeAutonomousValues(),
      computeTeleopValues(),
      computeEndgameValues(),
      computeCommentValues(),
      computeSuffixValues()
    ]);

    // ignore: avoid_print
    if (AppConstants.isDebug) print(computedValues);

    // Encode to UTF-8 and then base64 to compress size and reduce issues with characters
    List<int> utf8Encoded = utf8.encode(computedValues);

    return base64.encode(utf8Encoded);
  }

  /// Computes all prematch values and returns them as a single string separated by a caret
  static String computePrematchValues() {
    return computeValues([
      parseInt(PrematchValues.teamNumber.text), // index: 0
      parseInt(PrematchValues.matchNumber.text), // index: 1
      parseString(PrematchValues.initials.text), // index: 2
      parseString(SettingValues.selectedDriverStation.text) // index: 3
    ]);
  }

  /// Computes all autonomous values and returns them as a single string separated by a caret
  static String computeAutonomousValues() {
    return computeValues([
      parseInt(AutonomousValues.autoSpeakerScored.text), // index: 4
      parseInt(AutonomousValues.autoSpeakerMissed.text), // index: 5
      parseInt(AutonomousValues.autoAmpScored.text), // index: 6
      parseInt(AutonomousValues.autoAmpMissed.text), // index: 7
      parseString(AutonomousValues.autoMobility.text) // index: 8
    ]);
  }

  /// Computes all teleoperated values and returns them as a single string separated by a caret
  static String computeTeleopValues() {
    return computeValues([
      parseInt(TeleoperatedValues.coralNearL1.text), // index: 9
      parseInt(TeleoperatedValues.coralNearL2.text), // index: 10
      parseInt(TeleoperatedValues.coralNearL3.text), // index: 11
      parseInt(TeleoperatedValues.coralNearL4.text), // index: 12
      parseInt(TeleoperatedValues.coralFarL1.text), // index: 9
      parseInt(TeleoperatedValues.coralFarL2.text), // index: 10
      parseInt(TeleoperatedValues.coralFarL3.text), // index: 11
      parseInt(TeleoperatedValues.coralFarL4.text), // index: 12
      parseInt(TeleoperatedValues.coralMissed.text), // index: 13
      parseInt(TeleoperatedValues.algaeRemoved.text), // index: 14
      parseInt(TeleoperatedValues.algaeProcessor.text), // index: 15
      parseInt(TeleoperatedValues.algaeBarge.text), // index: 16
      parseInt(TeleoperatedValues.humanPlayerMisses.text), // index: 17
      parseInt(TeleoperatedValues.fieldCrosses.text), // index: 18
    ]);
  }

  /// Computes all endgame values and returns them as a single string separated by a caret
  static String computeEndgameValues() {
    return computeValues([
      parseString(EndgameValues.endgame.text), // index: 19
      parseString(EndgameValues.climbTime.text), // index: 20
      parseInt(EndgameValues.trap.text) // index: 21
    ]);
  }

  /// Computes all comment values and returns them as a single string separated by a caret
  static String computeCommentValues() {
    return computeValues([
      parseString(CommentValues.autoComments.text), // index: 22
      parseString(CommentValues.autoOrder.text), // index: 23
      parseString(CommentValues.teleopComments.text), // index: 24
      parseString(CommentValues.endgameComments.text) // index: 25
    ]);
  }

  /// Suffix's are only used for internal app usage only, they are not to be used for actual data that is stored on the CSV
  static String computeSuffixValues() {
    return computeValues([
      parseString(OptionConstants.availableDriverstations
          .indexOf(SettingValues.selectedDriverStation.text)
          .toString()) // index: 26
    ]);
  }

  /// Computes a list of strings and separates them with a caret and returns the resulting string
  static String computeValues(List<String> values) {
    return values.join("^");
  }

  /// Parses a string and removes any newline characters to prevent issues with the encoding and QR code storing
  static String parseString(String value) {
    return value.replaceAll("\n", "");
  }

  /// Parses an integer and returns it as a string, if the integer is null then it returns "0"
  static String parseInt(String value) {
    return (int.tryParse(value) ?? 0).toString();
  }
}
