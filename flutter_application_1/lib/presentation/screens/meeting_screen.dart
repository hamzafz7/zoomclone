import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/jitsi_meet_methods.dart';

import '../../common/constants.dart';
import '../widgets/home_meetings.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getheightspace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeButton(
                  onpressed: () {
                    var rand = Random();
                    String roomname =
                        (rand.nextInt(10000000) + 10000000).toString();

                    JitsiMeetMethods.makenewmeeting(
                        room: roomname, isaudiomuted: true, isvideomuted: true);
                  },
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.blue,
                    size: 40,
                  ),
                  text: "New Meeting"),
              HomeButton(
                  onpressed: () {
                    Navigator.pushNamed(context, "videocall");
                  },
                  icon: const Icon(
                    Icons.add_box_rounded,
                    color: Colors.blue,
                    size: 38,
                  ),
                  text: "Join Meeting"),
              HomeButton(
                  onpressed: () {},
                  icon: const Icon(
                    Icons.schedule,
                    color: Colors.blue,
                    size: 38,
                  ),
                  text: "Schedule"),
              HomeButton(
                  onpressed: () {},
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: Colors.blue,
                    size: 40,
                  ),
                  text: "Share Screen")
            ],
          ),
        ),
        Expanded(
            child: Center(
          child: Text(
            " Create your meeting with a click !",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.blue[300], fontSize: 20),
          ),
        ))
      ],
    );
  }
}
