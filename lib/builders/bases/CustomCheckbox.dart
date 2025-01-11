// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color checkColor;
  final Color labelColor;

  const CustomCheckbox({
    super.key,
    required this.controller,
    this.label = "",
    this.margin = const EdgeInsets.all(2.0),
    this.backgroundColor = Colors.grey,
    this.checkColor = Colors.white,
    this.labelColor = Colors.white,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.controller.text == "1";
    widget.controller.addListener(_updateStateFromController);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateStateFromController);
    super.dispose();
  }

  void _updateStateFromController() {
    setState(() {
      isChecked = widget.controller.text == "1";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      padding: const EdgeInsets.all(0),
      margin: widget.margin,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
                widget.controller.text = isChecked ? "1" : "0";
              });
            },
            checkColor: widget.checkColor,
            activeColor: Colors.blue,
          ),
          if (widget.label.isNotEmpty)
            Text(
              widget.label,
              style: TextStyle(
                color: widget.labelColor,
                fontSize: 16.0,
              ),
            ),
        ],
      ),
    );
  }
}
