// ignore_for_file: file_names
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:scouting_platform/utils/data/constants/AppConstants.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';

class AppDataHelper {
  // Save the current event ID to a file called "current_event_id.txt"
  static Future<void> saveCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(AppConstants.appDataFilePath);
      await file.writeAsString(
          "${SettingValues.eventID.text},${SettingValues.selectedDriverStation.text}");
    } else {
      throw Exception('Permission denied');
    }
  }

  // Get the current event ID from a file called "current_event_id.txt"
  static Future<String> getCurrentEventIDAndCurrentDriverStation() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = File(AppConstants.appDataFilePath);
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return "";
      }
    } else {
      throw Exception('Permission denied');
    }
  }

  static void resetStates() {
    resetAutoEtcValues();
    resetAutoReef();
    resetTeleopValues();
    resetEndgameValues();
    resetComments();
  }

  static void resetAutoEtcValues() {
    AutonomousValues.autoStartPosition.text = "Center";
    AutonomousValues.autoMobility.text = "No";
    AutonomousValues.coralMissed.text = "0";
    AutonomousValues.coralHP.text = "0";
    AutonomousValues.coralField.text = "0";
    AutonomousValues.algaeRemoved.text = "0";
    AutonomousValues.algaeBarge.text = "0";
    AutonomousValues.algaeProcessor.text = "0";
  }

  static void resetAutoReef() {
    // tough coral
    AutonomousValues.l1E.text = "0";
    AutonomousValues.l1NE.text = "0";
    AutonomousValues.l1NW.text = "0";
    AutonomousValues.l1SE.text = "0";
    AutonomousValues.l1SW.text = "0";
    AutonomousValues.l1W.text = "0";

    // L2 coral
    AutonomousValues.l2A.text = "0";
    AutonomousValues.l2B.text = "0";
    AutonomousValues.l2C.text = "0";
    AutonomousValues.l2D.text = "0";
    AutonomousValues.l2E.text = "0";
    AutonomousValues.l2F.text = "0";
    AutonomousValues.l2G.text = "0";
    AutonomousValues.l2H.text = "0";
    AutonomousValues.l2I.text = "0";
    AutonomousValues.l2J.text = "0";
    AutonomousValues.l2K.text = "0";
    AutonomousValues.l2L.text = "0";

    // L3 coral
    AutonomousValues.l3A.text = "0";
    AutonomousValues.l3B.text = "0";
    AutonomousValues.l3C.text = "0";
    AutonomousValues.l3D.text = "0";
    AutonomousValues.l3E.text = "0";
    AutonomousValues.l3F.text = "0";
    AutonomousValues.l3G.text = "0";
    AutonomousValues.l3H.text = "0";
    AutonomousValues.l3I.text = "0";
    AutonomousValues.l3J.text = "0";
    AutonomousValues.l3K.text = "0";
    AutonomousValues.l3L.text = "0";

    // L4 coral
    AutonomousValues.l4A.text = "0";
    AutonomousValues.l4B.text = "0";
    AutonomousValues.l4C.text = "0";
    AutonomousValues.l4D.text = "0";
    AutonomousValues.l4E.text = "0";
    AutonomousValues.l4F.text = "0";
    AutonomousValues.l4G.text = "0";
    AutonomousValues.l4H.text = "0";
    AutonomousValues.l4I.text = "0";
    AutonomousValues.l4J.text = "0";
    AutonomousValues.l4K.text = "0";
    AutonomousValues.l4L.text = "0";
  }

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

  static void resetEndgameValues() {
    EndgameValues.endgame.text = "No"; // was climb, now endgame
    EndgameValues.climbTime.text = "0"; // parked was below
    EndgameValues.stopwatchState.text = "0";
    EndgameValues.stopwatch.stop();
    EndgameValues.stopwatch.reset();
  }

  static void resetComments() {
    CommentValues.autoComments.text = "";
    CommentValues.autoOrder.text = "";
    CommentValues.teleopComments.text = "";
    CommentValues.endgameComments.text = "";
  }
}
