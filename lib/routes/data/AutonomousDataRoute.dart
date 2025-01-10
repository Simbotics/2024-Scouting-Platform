// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
import 'package:scouting_platform/routes/data/fields/AutonomousRows.dart/AutonomousBottomReef.dart';
import 'package:scouting_platform/routes/data/fields/AutonomousRows.dart/AutonomousMiddleReef.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
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
import 'package:scouting_platform/routes/data/fields/AutonomousRows.dart/AutonomousTopReef.dart';

class AutonomousDataRoute extends StatefulWidget {
  const AutonomousDataRoute({super.key, required this.title});
  final String title;

  @override
  State<AutonomousDataRoute> createState() => _DataRouteState();
}

class _DataRouteState extends State<AutonomousDataRoute> {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleStyle(
                      text: "Auto Data",
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    const SizedBox(height: 20.0),
                    const AutonomousTopReef(),
                    const AutonomousMiddleReef(),
                    const AutonomousBottomReef(),
                  ],
                ),
              ),
              // Right Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150.0, 47.0),
                            backgroundColor: AppStyle.textInputColor,
                          ),
                          onPressed: () {
                            showConformationDialog(context);
                          },
                          child: const Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Helvetica",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150.0, 47.0),
                            backgroundColor: AppStyle.textInputColor,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const CommentsRoute(title: "Comments");
                            }));
                          },
                          child: const Text(
                            "Comments >",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Helvetica",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showConformationDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        if (PrematchValues.matchNumber.text != "") {
          PrematchValues.matchNumber.text =
              (int.parse(PrematchValues.matchNumber.text) + 1).toString();
        } else {
          PrematchValues.matchNumber.text = (2).toString();
        }

        if (SettingValues.isTeamNumberReadOnly) {
          Schedulehelper.getTeamNumberFromSchedule(
            int.parse(PrematchValues.matchNumber.text),
          ).then((teamNumber) =>
              PrematchValues.teamNumber.text = teamNumber.toString());
        }

        setState(() {
          AutonomousValues.autoSpeakerScored.text = "0";
          AutonomousValues.autoSpeakerMissed.text = "0";
          AutonomousValues.autoAmpMissed.text = "0";
          AutonomousValues.autoAmpScored.text = "0";
          TeleoperatedValues.speaker.text = "0";
          TeleoperatedValues.speakerMissed.text = "0";
          TeleoperatedValues.amp.text = "0";
          TeleoperatedValues.ampMissed.text = "0";
          AutonomousValues.autoMobility.text = "No";
          EndgameValues.endgame.text = "No";
          EndgameValues.climbTime.text = "0";
          EndgameValues.stopwatchState.text = "0";
          TeleoperatedValues.passes.text = "0";
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
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation: Reset ALL Fields"),
      content: const Text(
          "Would you like to reset all of the fields currently inputted?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
