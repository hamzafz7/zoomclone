import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FireBaseAuthMethods/auth_methods.dart';
import 'package:flutter_application_1/presentation/widgets/CustomButton.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final auth_method = AuthMethods();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("MyZOom"),
      ),
      body: Column(children: [
        getheightspace(30),
        Lottie.asset("assets/animations/videocall.json",
            width: double.infinity, height: h / 3),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Get to Talk with your friends , co-workers , or your family at anytime you want ! , Sign in to Know more !..",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        getheightspace(30),
        CustomButton(
          text: "Sign In with Google ",
          onpressed: () async {
            bool auth = await auth_method.googleSignIn(context);
            if (!auth) {
              print("hhhh");
            }
            if (auth) {}
          },
        )
      ]),
    ));
  }
}
