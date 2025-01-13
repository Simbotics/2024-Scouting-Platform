// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields2.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields3.dart';
import 'package:scouting_platform/routes/teleop/fields/TeleoperatedFields4.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels2.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels3.dart';
import 'package:scouting_platform/routes/teleop/labels/TeleoperatedLabels4.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
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
                padding: const EdgeInsets.only(left: 20, top: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150.0, 40.0),
                    backgroundColor: AppStyle.textInputColor,
                  ),
                  onPressed: () {
                    showConformationDialog(context);
                  },
                  child: const Text("Reset",
                      style: TextStyle(
                          fontSize: 14.0,
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
                          minimumSize: const Size(150.0, 40.0),
                          backgroundColor: AppStyle
                              .textInputColor, // Set the background color here
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AutonomousDataRoute(title: "Auto");
                          }));
                        },
                        child: const Text("< Auto",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Helvetica",
                                color: Colors.white)),
                      ))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(top: 4.0, right: 60),
                      // height: 47.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150.0, 40.0),
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
                                fontSize: 14.0,
                                fontFamily: "Helvetica",
                                color: Colors.white)),
                      ))),
            ],
          ),
          // robot info
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 400.0,
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  "Driver Station: ${SettingValues.selectedDriverStation.text}, Match #: ${PrematchValues.matchNumber.text}, Team #: ${PrematchValues.teamNumber.text}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              )),
          const TeleoperatedLabels4(),
          const TeleoperatedFields4(),
          const TeleoperatedLabels3(),
          const TeleoperatedFields3(),
          const TeleoperatedLabels2(),
          const TeleoperatedFields2(),
          const TeleoperatedLabels(),
          const TeleoperatedFields(),
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
          AppDataHelper.resetStates();
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
