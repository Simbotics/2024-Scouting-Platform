// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_platform/builders/PlatformRoute.dart';
import 'package:scouting_platform/utils/helpers/QRCodeHelper.dart';
import 'package:scouting_platform/utils/helpers/UIHelper.dart';

class QRCodeRoute extends StatelessWidget {
  const QRCodeRoute({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    UIHelper.setBrightness(1.0);

    return PlatformRoute(
        title: title,
        body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // Fit to fill the whole screen
                child: QrImageView(
                  data: QrcodeHelper.getQRCodeString(),
                  backgroundColor: Colors.white,
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                  version: QrVersions.auto,
                ))));
  }
}
