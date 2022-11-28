import 'package:flutter/material.dart';

class EditingContainer extends StatelessWidget {
  const EditingContainer({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      onChanged: (value) {
        // setState(() {
        //   currentText = value;
        // });
        // widget.onChanged(currentText);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        labelStyle: TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
