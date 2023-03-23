import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function()? onpressed;
  CustomButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        height: h * 0.06,
        minWidth: w / 1.6,
        onPressed: onpressed,
        color: Colors.blue,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
