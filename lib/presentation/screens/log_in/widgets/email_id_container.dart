import 'package:flutter/material.dart';

class EmailIdContainer extends StatefulWidget {
  const EmailIdContainer({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<String> onChanged;
  @override
  State<EmailIdContainer> createState() => _EmailIdContainerState();
}

class _EmailIdContainerState extends State<EmailIdContainer> {
  String currentText = '';
  late FocusNode _focusNode;
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        onTap: () {
          _focusNode.requestFocus();
        },
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
          widget.onChanged(currentText);
        },
        autofocus: true,
        focusNode: _focusNode,
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Icon(Icons.email_outlined),
          ),
          hintText: 'Email address',
          labelStyle: TextStyle(fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
