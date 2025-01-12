// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow1.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow2.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow3.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow4.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow5.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousCheckboxRows/AutonomousRow6.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRightRows/AutonomousRightRow1.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRightRows/AutonomousRightRow2.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRightRows/AutonomousRightRow3.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRows.dart/AutonomousBottomReef.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRows.dart/AutonomousMiddleReef.dart';
import 'package:scouting_platform/routes/auto/fields/AutonomousRows.dart/AutonomousTopReef.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousRightLabels/AutonomousRightLabel1.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousRightLabels/AutonomousRightLabel2.dart';
import 'package:scouting_platform/routes/auto/labels/AutonomousRightLabels/AutonomousRightLabel3.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/AutonomousValues.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/ScheduleHelper.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

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
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // all components of reef diagram
                    // top check boxes
                    const AutonomousRow1(),
                    const AutonomousRow2(),
                    const AutonomousRow3(),

                    // thirds of the reef diagram with counters for trough
                    const AutonomousTopReef(),
                    const AutonomousMiddleReef(),
                    const AutonomousBottomReef(),

                    // bottom check boxes
                    const AutonomousRow4(),
                    const AutonomousRow5(),
                    const AutonomousRow6(),
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
                        // TitleStyle(
                        //     text: "L4",
                        //     padding: const EdgeInsets.only(
                        //         right: 0.0, bottom: 10.0)),
                        SizedBox(
                          width: 120.0,
                        ),

                        // reset button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150.0, 37.0),
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

                        // next page button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150.0, 37.0),
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
                    // various right side data entry and labels
                    const AutonomousRightLabel1(),
                    const AutonomousRightRow1(),
                    const AutonomousRightLabel2(),
                    const AutonomousRightRow2(),
                    const AutonomousRightLabel3(),
                    const AutonomousRightRow3(),
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
