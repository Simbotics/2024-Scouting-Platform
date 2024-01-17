// ignore_for_file: file_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/fields/counterNumberField.dart';
import 'package:scouting_platform/builders/fields/dropdownMenu.dart';
import 'package:scouting_platform/utils/data/data.dart';

class Row3Fields extends StatefulWidget {
  const Row3Fields({
    Key? key,
  }) : super(key: key);

  @override
  _Row3FieldsState createState() => _Row3FieldsState();
}

class _Row3FieldsState extends State<Row3Fields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //climb dropdown
       ScoutingDropdownMenu(
          dropdownMenuSelectedItem: Data.climb.text, 
          onChanged: (value) {
              setState(() {
                Data.climb.text = value;
              });
            },
          dropdownItems: Data.yesNoOptions, 
          margin: const EdgeInsets.only(left: 20)),
        //climb time
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.autoSpeakerMissed),
        //trap
        CounterNumberField(
          onTapDecrement: () {}, 
          onTapIncrement: () {}, 
          controller: Data.trap),
        //spotlight
        ScoutingDropdownMenu(
          dropdownMenuSelectedItem: Data.spotlight.text, 
          onChanged: (value) {
              setState(() {
                Data.spotlight.text = value;
              });
            },
          dropdownItems: Data.yesNoOptions, 
          margin: const EdgeInsets.only(left: 20)),
        ],
    );
  }
}