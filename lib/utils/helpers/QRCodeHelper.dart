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
      // L1 Coral Values
      parseInt(AutonomousValues.l1NW.text), // index 4
      parseInt(AutonomousValues.l1NE.text), // index 5
      parseInt(AutonomousValues.l1W.text), // index 6
      parseInt(AutonomousValues.l1E.text), // index 7
      parseInt(AutonomousValues.l1SW.text), // index 8
      parseInt(AutonomousValues.l1SE.text), // index 9

      // L2 Coral Values
      parseInt(AutonomousValues.l2A.text), // index 10
      parseInt(AutonomousValues.l2B.text), // index 11
      parseInt(AutonomousValues.l2C.text), // index 12
      parseInt(AutonomousValues.l2D.text), // index 13
      parseInt(AutonomousValues.l2E.text), // index 14
      parseInt(AutonomousValues.l2F.text), // index 15
      parseInt(AutonomousValues.l2G.text), // index 16
      parseInt(AutonomousValues.l2H.text), // index 17
      parseInt(AutonomousValues.l2I.text), // index 18
      parseInt(AutonomousValues.l2J.text), // index 19
      parseInt(AutonomousValues.l2K.text), // index 20
      parseInt(AutonomousValues.l2L.text), // index 21

      // L3 Coral Values
      parseInt(AutonomousValues.l3A.text), // index 22
      parseInt(AutonomousValues.l3B.text), // index 23
      parseInt(AutonomousValues.l3C.text), // index 24
      parseInt(AutonomousValues.l3D.text), // index 25
      parseInt(AutonomousValues.l3E.text), // index 26
      parseInt(AutonomousValues.l3F.text), // index 27
      parseInt(AutonomousValues.l3G.text), // index 28
      parseInt(AutonomousValues.l3H.text), // index 29
      parseInt(AutonomousValues.l3I.text), // index 30
      parseInt(AutonomousValues.l3J.text), // index 31
      parseInt(AutonomousValues.l3K.text), // index 32
      parseInt(AutonomousValues.l3L.text), // index 33

      // L4 Coral Values
      parseInt(AutonomousValues.l3A.text), // index 34
      parseInt(AutonomousValues.l3B.text), // index 35
      parseInt(AutonomousValues.l3C.text), // index 36
      parseInt(AutonomousValues.l3D.text), // index 37
      parseInt(AutonomousValues.l3E.text), // index 38
      parseInt(AutonomousValues.l3F.text), // index 39
      parseInt(AutonomousValues.l3G.text), // index 40
      parseInt(AutonomousValues.l3H.text), // index 41
      parseInt(AutonomousValues.l3I.text), // index 42
      parseInt(AutonomousValues.l3J.text), // index 43
      parseInt(AutonomousValues.l3K.text), // index 44
      parseInt(AutonomousValues.l3L.text), // index 45
    ]);
  }

  /// Computes all teleoperated values and returns them as a single string separated by a caret
  static String computeTeleopValues() {
    return computeValues([
      parseInt(TeleoperatedValues.speaker.text), // index: 9
      parseInt(TeleoperatedValues.speakerMissed.text), // index: 10
      parseInt(TeleoperatedValues.amp.text), // index: 11
      parseInt(TeleoperatedValues.ampMissed.text), // index: 12
      parseInt(TeleoperatedValues.passes.text) // index: 13
    ]);
  }

  /// Computes all endgame values and returns them as a single string separated by a caret
  static String computeEndgameValues() {
    return computeValues([
      parseString(EndgameValues.endgame.text), // index: 14
      parseString(EndgameValues.climbTime.text), // index: 15
      parseInt(EndgameValues.trap.text) // index: 16
    ]);
  }

  /// Computes all comment values and returns them as a single string separated by a caret
  static String computeCommentValues() {
    return computeValues([
      parseString(CommentValues.autoComments.text), // index: 17
      parseString(CommentValues.autoOrder.text), // index: 18
      parseString(CommentValues.teleopComments.text), // index: 19
      parseString(CommentValues.endgameComments.text) // index: 20
    ]);
  }

  /// Suffix's are only used for internal app usage only, they are not to be used for actual data that is stored on the CSV
  static String computeSuffixValues() {
    return computeValues([
      parseString(OptionConstants.availableDriverstations
          .indexOf(SettingValues.selectedDriverStation.text)
          .toString()) // index: 21
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
