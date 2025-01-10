import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final String label;
  final Function(bool?) onChanged;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color checkColor;
  final Color labelColor;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.label = "",
    this.margin = const EdgeInsets.only(left: 20.0),
    this.backgroundColor = Colors.grey,
    this.checkColor = Colors.white,
    this.labelColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      padding: const EdgeInsets.all(3),
      margin: margin,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
            checkColor: checkColor,
            activeColor: backgroundColor,
          ),
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontSize: 16.0,
              ),
            ),
        ],
      ),
    );
  }
}
