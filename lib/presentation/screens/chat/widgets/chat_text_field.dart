import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/paddings&margins.dart';
import 'package:whats_app/presentation/screens/chat/widgets/suffix_row.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    Key? key,
    required FocusNode focusNode,
    required TextEditingController controller,
    required this.onTap,
  })  : _focusNode = focusNode,
        _controller = controller,
        super(key: key);

  final FocusNode _focusNode;
  final TextEditingController _controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: TextFormField(
        focusNode: _focusNode,
        controller: _controller,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: Paddings.chatTextFieldContentPadding,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: ColorConstants.grey,
          hintText: 'Type a message..',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Padding(
            padding: Paddings.prefixIconPaddig,
            child: InkWell(
              child: IconConstants.smiley,
            ),
          ),
          suffixIcon: SuffixRox(),
        ),
      ),
    );
  }
}
