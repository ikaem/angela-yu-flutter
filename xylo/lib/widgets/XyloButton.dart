import 'package:flutter/material.dart';

typedef PlayFile = void Function();

class XyloButton extends StatelessWidget {
  final Color color;
  final PlayFile playFile;
  const XyloButton({
    Key? key,
    required this.color,
    required this.playFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        child: const Text("hello"),
        onPressed: () {
          // _playFile(file);
          playFile();
        },
      ),
    );
  }
}
