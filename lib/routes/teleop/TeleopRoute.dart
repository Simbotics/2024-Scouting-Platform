// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields2.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields3.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels2.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels3.dart';
import 'package:scouting_platform/routes/teleop/fields/EndgameFields.dart';
import 'package:scouting_platform/routes/teleop/labels/EndgameLabels.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/CommentValues.dart';
import 'package:scouting_platform/utils/data/values/EndgameValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/data/values/TeleoperatedValues.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class TeleopRoute extends StatefulWidget {
  const TeleopRoute({super.key, required this.title});
  final String title;

  @override
  State<TeleopRoute> createState() => _TeleopRouteState();
}

class _TeleopRouteState extends State<TeleopRoute> {
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
                            return const CommentsRoute(title: "Comments");
                          }));
                        },
                        child: const Text("Comments >",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Helvetica",
                                color: Colors.white)),
                      ))),
            ],
          ),
          const TeleoperatedLabels(),
          const TeleoperatedFields(),
          const TeleoperatedLabels2(),
          const TeleoperatedFields2(),
          const TeleoperatedLabels3(),
          const TeleoperatedFields3(),
          const EndgameLabels(),
          const EndgameFields(),
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
          // main
          AutonomousValues.autoStartPosition.text = "center";
          AutonomousValues.autoMobility.text = "no";
          AutonomousValues.coralMissed.text = "0";
          AutonomousValues.coralHP.text = "0";
          AutonomousValues.coralField.text = "0";
          AutonomousValues.algaeRemoved.text = "0";
          AutonomousValues.algaeBarge.text = "0";
          AutonomousValues.algaeProcessor.text = "0";

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
