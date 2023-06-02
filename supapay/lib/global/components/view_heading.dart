import 'package:flutter/material.dart';

class ViewHeading extends StatelessWidget {
  const ViewHeading({Key? key, required this.heading}) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
        (heading),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700
        ),
    );
  }
}
