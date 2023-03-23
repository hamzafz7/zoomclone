import 'package:flutter/material.dart';
import '../presentation/screens/contacts_screen.dart';
import '../presentation/screens/history_meeting.dart';
import '../presentation/screens/meeting_screen.dart';
import '../presentation/screens/settings_screen.dart';

Widget getheightspace(double h) {
  return SizedBox(height: h);
}

showSnackbar(BuildContext context, String? text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text!)));
}

List<Widget> items = const [
  Icon(Icons.comment_bank),
  Icon(Icons.lock_clock),
  Icon(Icons.person_outlined),
  Icon(Icons.settings),
];
List<Widget> screens = [
  const MeetingScreen(),
  const HistoryMeetingsScreen(),
  const ContactsScreen(),
  const SettingsScreen()
];
