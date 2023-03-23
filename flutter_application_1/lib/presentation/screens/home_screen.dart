import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/common/constants.dart';
import 'package:flutter_application_1/presentation/widgets/home_meetings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int page = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet and Chat"),
        centerTitle: true,
      ),
      body: screens[page],
      bottomNavigationBar: CurvedNavigationBar(
        height: h * 0.06,
        key: _bottomNavigationKey,
        items: items,
        onTap: (value) {
          setState(() {
            page = value;
          });
        },
      ),
    );
  }
}
