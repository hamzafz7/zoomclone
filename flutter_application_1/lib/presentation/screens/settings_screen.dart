import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/data/FireBaseAuthMethods/auth_methods.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
        child: const Text("Logout"),
        onPressed: () {
          AuthMethods.signout();
        },
      )),
    );
  }
}
