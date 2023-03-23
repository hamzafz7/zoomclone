import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constants.dart';
import 'package:flutter_application_1/data/FireBaseAuthMethods/auth_methods.dart';
import 'package:flutter_application_1/data/jitsi_meet_methods.dart';
import 'package:flutter_application_1/presentation/widgets/meeting_options.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late TextEditingController meetingidcontroller;

  bool isaudiomute = true;

  bool isvideomute = true;

  late TextEditingController namecontroller;
  @override
  dispose() {
    super.dispose();
    namecontroller.dispose();
    meetingidcontroller.dispose();
  }

  @override
  initState() {
    super.initState();
    namecontroller = TextEditingController(text: AuthMethods.user?.displayName);
    meetingidcontroller = TextEditingController();
  }

  _joimeeting() {
    JitsiMeetMethods.makenewmeeting(
        room: meetingidcontroller.text,
        username: namecontroller.text,
        isaudiomuted: isaudiomute,
        isvideomuted: isvideomute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Join a meeting",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: meetingidcontroller,
              minLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none,
                hintText: "Enter room Id",
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namecontroller,
              minLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyText1,
                border: InputBorder.none,
                hintText: "name ",
              ),
            )),
        getheightspace(15),
        TextButton(
            onPressed: () {
              _joimeeting();
            },
            child: Text(
              "Join",
              style: Theme.of(context).textTheme.bodyText1,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: MeetingOption(
            text: "Mute audio",
            ismute: isaudiomute,
            onchange: onaaudiomuted,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: MeetingOption(
            text: "Turn off my video",
            ismute: isvideomute,
            onchange: onvideomuted,
          )),
        )
      ]),
    );
  }

  onaaudiomuted(bool val) {
    setState(() {
      isaudiomute = val;
    });
  }

  onvideomuted(bool val) {
    setState(() {
      isvideomute = val;
    });
  }
}
