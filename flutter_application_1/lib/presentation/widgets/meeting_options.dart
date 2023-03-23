import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  MeetingOption(
      {super.key,
      required this.text,
      required this.ismute,
      required this.onchange});
  String text;
  bool ismute;
  Function(bool) onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          text,
          style: const TextStyle(color: Colors.blue, fontSize: 18),
        ),
        Switch.adaptive(value: ismute, onChanged: onchange)
      ]),
    );
  }
}
