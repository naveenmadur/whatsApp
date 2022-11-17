import 'package:flutter/material.dart';

class PasswordContainer extends StatefulWidget {
  const PasswordContainer({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<String> onChanged;
  @override
  State<PasswordContainer> createState() => _UserNameContainer();
}

class _UserNameContainer extends State<PasswordContainer> {
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
        validator: (value) {
          if (value!.isEmpty) {
            // hasError = true;
            return 'Can\'t be empty';
          }
          if (value.length < 6) {
            // hasError = true;
            return 'Should have more than 5 characters';
          } else {
            // hasError = false;
            return null;
          }
        },
        onChanged: (value) {
          debugPrint(value);
          setState(() {
            currentText = value;
          });
          widget.onChanged(currentText);
        },
        autofocus: true,
        focusNode: _focusNode,
        controller: _controller,
        obscureText: true,
        obscuringCharacter: '#',
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Icon(Icons.person),
          ),
          hintText: 'Password',
          labelStyle: TextStyle(fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
