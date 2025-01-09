// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousFields.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousLabels.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/routes/teleop/TeleopRoute.dart';
import 'package:scouting_platform/styles/components/TitleStyle.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class AutoRoute extends StatefulWidget {
  const AutoRoute({super.key, required this.title});
  final String title;

  @override
  State<AutoRoute> createState() => _AutoRouteState();
}

class _AutoRouteState extends State<AutoRoute> {
  @override
  void initState() {
    super.initState();
    UIHelper.setBrightness(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformRoute(
      title: widget.title,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleStyle(
                  text: "Auto Data",
                  padding: EdgeInsets.only(top: 10.0, left: 20.0)),
              Padding(
                padding:
                    const EdgeInsets.only(right: 50.0, top: 10.0, left: 125.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150.0, 47.0),
                    backgroundColor: AppStyle.textInputColor,
                  ),
                  onPressed: () {
                    showConformationDialog(context);
                  },
                  child: const Text("Reset",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Helvetica",
                          color: Colors.white)),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(top: 4.0, right: 60),
                      // height: 47.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150.0, 47.0),
                          backgroundColor: AppStyle
                              .textInputColor, // Set the background color here
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TeleopRoute(title: "Teleop/Endgame");
                          }));
                        },
                        child: const Text("Teleop/Endgame >",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Helvetica",
                                color: Colors.white)),
                      ))),
            ],
          ),
          const AutonomousLabels(),
          const AutonomousFields(),
        ]),
      ),
    );
  }

  showConformationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        // Increment the match number
        if (PrematchValues.matchNumber.text != "") {
          PrematchValues.matchNumber.text =
              (int.parse(PrematchValues.matchNumber.text) + 1).toString();
        } else {
          PrematchValues.matchNumber.text = (2).toString();
        }

        if (SettingValues.isTeamNumberReadOnly) {
          // Get the team number from the schedule and set the team number field to that
          Schedulehelper.getTeamNumberFromSchedule(
                  int.parse(// Get the team number from the schedule
                      PrematchValues.matchNumber.text))
              .then((teamNumber) =>
                  PrematchValues.teamNumber.text = teamNumber.toString());
        }

        setState(() {
          AutonomousValues.autoSpeakerScored.text = "0";
          AutonomousValues.autoSpeakerMissed.text = "0";
          AutonomousValues.autoAmpMissed.text = "0";
          AutonomousValues.autoAmpScored.text = "0";
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
          AutonomousValues.autoMobility.text = "No";
          EndgameValues.endgame.text = "No"; // was climb, now endgame
          EndgameValues.climbTime.text = "0"; // parked was below
          EndgameValues.stopwatchState.text = "0";
          EndgameValues.trap.text = "0";
          EndgameValues.stopwatch.stop();
          EndgameValues.stopwatch.reset();
          CommentValues.autoComments.text = "";
          CommentValues.autoOrder.text = "";
          CommentValues.teleopComments.text = "";
          CommentValues.endgameComments.text = "";
        });
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const PrematchRoute(title: "Prematch Data");
        }));
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation: Reset ALL Fields"),
      content: const Text(
          "Would you like to reset all of the fields current inputted?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
