import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  HomeButton(
      {super.key,
      required this.onpressed,
      required this.icon,
      required this.text});
  Function() onpressed;
  Icon icon;
  String text;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: onpressed,
          child: Column(children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: w / 3.4,
                height: h / 11,
                color: Colors.grey[50],
                child: icon,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ])
          ])),
    );
  }
}
