import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/firestoremethods.dart';
import '../../common/constants.dart';
import '../widgets/home_meetings.dart';

class HistoryMeetingsScreen extends StatelessWidget {
  const HistoryMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreMethods.history,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text("No history found"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("No history found"),
          );
        } else {
          return ListView.builder(
              itemCount: (snapshot.data as dynamic).docs.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Text(
                        "${(snapshot.data as dynamic).docs[index]["meeting_name"]}")
                  ],
                );
              }));
        }
      },
    );
  }
}
