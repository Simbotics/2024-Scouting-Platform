// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/routes/auto/AutonomousDataRoute.dart';
import 'package:scouting_platform/routes/comments/CommentsRoute.dart';
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
          // Top-right aligned buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150.0, 37.0),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: AppStyle.textInputColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AutonomousDataRoute(title: "Auto");
                    }));
                  },
                  child: const Text("< Auto",
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150.0, 37.0),
                    backgroundColor: AppStyle.textInputColor,
                    padding: EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CommentsRoute(title: "Comments");
                    }));
                  },
                  child: const Text("Comments >",
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ),
            ],
          ),
          // Other content
          const TeleoperatedLabels4(),
          const TeleoperatedFields4(),
          const TeleoperatedLabels3(),
          const TeleoperatedFields3(),
          const TeleoperatedLabels2(),
          const TeleoperatedFields2(),
          const TeleoperatedLabels(),
          const TeleoperatedFields(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 400.0,
              padding: const EdgeInsets.only(top: 55.0, left: 90.0),
              child: Text(
                "Driver Station: ${SettingValues.selectedDriverStation.text}, Match #${PrematchValues.matchNumber.text}, Team #${PrematchValues.teamNumber.text}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
