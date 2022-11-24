import 'package:flutter/material.dart';
import 'package:whats_app/presentation/screens/chat/widgets/attach_file_icon.dart';
import 'package:whats_app/presentation/screens/chat/widgets/camera_icon.dart';

class SuffixRox extends StatelessWidget {
  const SuffixRox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        AttachFileIcon(),
        SizedBox(width: 10),
        CameraIcon(),
        SizedBox(width: 10),
      ],
    );
  }
}
