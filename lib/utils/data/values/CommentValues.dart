// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CommentValues {
  static final TextEditingController autoComments =
      TextEditingController(text: "");
  static final TextEditingController teleopComments =
      TextEditingController(text: "");
  static final TextEditingController endgameComments =
      TextEditingController(text: "");

  static void resetComments() {
    CommentValues.autoComments.text = "";
    CommentValues.teleopComments.text = "";
    CommentValues.endgameComments.text = "";
  }
}
