import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class GreenCheckbox extends StatefulWidget {
  const GreenCheckbox({super.key});

  @override
  State<GreenCheckbox> createState() => _GreenCheckboxState();
}

class _GreenCheckboxState extends State<GreenCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(
        color: ColorConstants.primary_green,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      activeColor: ColorConstants.primary_green,
      value: this.value,
      onChanged: (value) {
        setState(() {
          this.value = value!;
        });
      },
      checkColor: Colors.white,
      autofocus: true,
      focusColor: ColorConstants.primary_green,
    );
  }
}
