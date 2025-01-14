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
import 'package:scouting_platform/routes/prematch/PrematchRoute.dart';
import 'package:scouting_platform/routes/teleop/TeleopRoute.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'package:scouting_platform/utils/data/values/PrematchValues.dart';
import 'package:scouting_platform/utils/data/values/SettingValues.dart';
import 'package:scouting_platform/utils/helpers/AppDataHelper.dart';
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
                        // reset button
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150.0, 37.0),
                              backgroundColor: AppStyle.textInputColor,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const PrematchRoute(title: "Prematch");
                              }));
                            },
                            child: const Text(
                              "< Prematch",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Helvetica",
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(width: 8.0),

                        const SizedBox(width: 8.0),

                        // next page button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150.0, 37.0),
                            backgroundColor: AppStyle.textInputColor,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const TeleopRoute(title: "Comments");
                            }));
                          },
                          child: const Text(
                            "Teleop >",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Helvetica",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // robot information
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 400.0,
                          padding: const EdgeInsets.only(top: 20.0, right: 0.0),
                          child: Text(
                            "Driver Station: ${SettingValues.selectedDriverStation.text}, Match #: ${PrematchValues.matchNumber.text}, Team # ${PrematchValues.teamNumber.text}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        )),
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
}
