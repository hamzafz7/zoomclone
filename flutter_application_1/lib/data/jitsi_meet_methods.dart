import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FireBaseAuthMethods/auth_methods.dart';
import 'package:flutter_application_1/data/firestoremethods.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  static Future<void> makenewmeeting(
      {required String room,
      bool? isaudiomuted,
      bool? isvideomuted,
      String username = ''}) async {
    try {
      Map<FeatureFlag, Object> featureFlags = {};
      String? name;
      if (username.isEmpty) {
        name = AuthMethods.user?.displayName;
      } else {
        name = username;
      }

      // Define meetings options here
      var options = JitsiMeetingOptions(
        roomNameOrUrl: room,
        isAudioMuted: isaudiomuted,
        isVideoMuted: isvideomuted,
        userDisplayName: name,
        userEmail: AuthMethods.user?.email,
        featureFlags: featureFlags,
      );
      FireStoreMethods.addHistoryMeeting(MettingName: room);
      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeetWrapper.joinMeeting(
          options: options,
          listener: JitsiMeetingListener(
              onOpened: () => debugPrint("onOpened"),
              onConferenceWillJoin: (url) {
                debugPrint("onConferenceWillJoin: url: $url");
              }));
    } catch (e) {
      print("error : ${e.toString()}");
    }
  }
}
